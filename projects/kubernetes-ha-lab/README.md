# ☸️ Kubernetes HA Lab — Enterprise Administration Portfolio

## Objective
Design, bootstrap, validate and troubleshoot a highly available Kubernetes cluster with multiple control-plane nodes, an API VIP/load balancer, workers, RBAC, workloads and persistent storage.

## Architecture
```text
kubectl → API VIP :6443 → HAProxy
                         ├─ master-01
                         ├─ master-02
                         └─ master-03
                              │
                         worker-01/02
                              │
                         CNI → CSI/Storage
```

> All IPs/domains in this repository are examples. Replace them with your own lab values.

## 1. Pre-flight Checks

```bash
cat /etc/os-release
hostnamectl
ip addr
ip route
timedatectl
chronyc tracking
getent hosts master-01.example.local
getent hosts master-02.example.local
swapon --show
```

Check API connectivity:

```bash
nc -zv <api-vip> 6443
```

## 2. Node Networking

Typical Kubernetes prerequisites:

```bash
lsmod | egrep 'overlay|br_netfilter'
sysctl net.ipv4.ip_forward
sysctl net.bridge.bridge-nf-call-iptables
```

Persist required settings under `/etc/sysctl.d/` for your chosen Kubernetes version.

## 3. HAProxy API Endpoint

Example backend test:

```bash
nc -zv 192.0.2.11 6443
nc -zv 192.0.2.12 6443
nc -zv 192.0.2.13 6443
```

Validate HAProxy:

```bash
haproxy -c -f /etc/haproxy/haproxy.cfg
systemctl status haproxy
journalctl -u haproxy --since "30 min ago"
```

## 4. kubeadm Bootstrap Example

Use the API endpoint, not an individual control-plane address.

```yaml
apiVersion: kubeadm.k8s.io/v1beta4
kind: InitConfiguration
localAPIEndpoint:
  advertiseAddress: 192.0.2.11
  bindPort: 6443
---
apiVersion: kubeadm.k8s.io/v1beta4
kind: ClusterConfiguration
controlPlaneEndpoint: "k8s-api.example.local:6443"
networking:
  podSubnet: "10.244.0.0/16"
```

Bootstrap:

```bash
sudo kubeadm init --config kubeadm-config.yaml --upload-certs
```

Configure kubectl:

```bash
mkdir -p ~/.kube
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown "$(id -u):$(id -g)" ~/.kube/config
kubectl cluster-info
kubectl get nodes
```

Use the generated `kubeadm join` command for additional control-plane/worker nodes.

## 5. Workloads

```bash
kubectl create namespace portfolio-demo
kubectl apply -f manifests/sample-workload.yaml
kubectl get deploy,pods,svc -n portfolio-demo
kubectl rollout status deployment/web -n portfolio-demo
```

Scale and rollback:

```bash
kubectl scale deployment web --replicas=5 -n portfolio-demo
kubectl rollout history deployment/web -n portfolio-demo
kubectl rollout undo deployment/web -n portfolio-demo
```

## 6. ConfigMaps and Secrets

```bash
kubectl create configmap app-config   --from-literal=APP_MODE=production -n portfolio-demo

kubectl create secret generic app-secret   --from-literal=DB_PASSWORD='REPLACE_ME' -n portfolio-demo
```

Never commit real secrets.

## 7. RBAC

```bash
kubectl create serviceaccount portfolio-user -n portfolio-demo
kubectl auth can-i get pods   --as=system:serviceaccount:portfolio-demo:portfolio-user   -n portfolio-demo
```

Follow least privilege.

## 8. Health Checks

```bash
kubectl get nodes -o wide
kubectl get pods -A
kubectl get --raw='/readyz?verbose'
kubectl get --raw='/livez?verbose'
kubectl get events -A --sort-by=.lastTimestamp
systemctl status kubelet
journalctl -u kubelet --since "30 min ago"
```

## 9. Troubleshooting

### Node NotReady

```bash
kubectl describe node <node>
systemctl status kubelet
journalctl -u kubelet -n 200
df -h
free -h
```

Check disk/memory pressure, runtime, CNI, certificates and kubelet.

### Pod Pending

```bash
kubectl describe pod <pod> -n <namespace>
kubectl get events -n <namespace> --sort-by=.lastTimestamp
```

Check requests, taints/tolerations, affinity, node selectors and PVCs.

### CrashLoopBackOff

```bash
kubectl logs <pod> -n <namespace>
kubectl logs <pod> -n <namespace> --previous
kubectl describe pod <pod> -n <namespace>
```

### Service Unreachable

```bash
kubectl get svc,endpoints,endpointslices -n <namespace>
kubectl get pods --show-labels -n <namespace>
```

Trace:

```text
Service → selector → EndpointSlice → Pod IP → container listener
```

### API VIP Problem

```bash
nc -zv <api-vip> 6443
curl -k https://<api-vip>:6443/livez
journalctl -u haproxy
```

Test every backend individually before changing Kubernetes components.

## What This Demonstrates

Cluster architecture, HA control plane concepts, Linux administration, load balancing, bootstrap, RBAC, workloads, storage and evidence-driven troubleshooting.
