# 🔴 OpenShift UPI on VMware — Enterprise Deployment Reference

## Objective
Reference design for OpenShift User-Provisioned Infrastructure on VMware using RHCOS, Ignition, DNS/NTP and HAProxy.

## Architecture
```text
DNS/NTP → HAProxy
           ├─ API :6443 → master-01/02/03
           └─ Ingress :443 → worker-01/02
                         ↓
                    VMware vSphere
```

## 1. DNS

Typical records:

```text
api.<cluster>.<base-domain>
api-int.<cluster>.<base-domain>
*.apps.<cluster>.<base-domain>
```

Validate:

```bash
dig +short api.cluster.example.com
dig +short api-int.cluster.example.com
dig +short console-openshift-console.apps.cluster.example.com
```

## 2. NTP

```bash
timedatectl
chronyc tracking
chronyc sources -v
```

Time drift can cause authentication, certificate and cluster instability.

## 3. Ignition Workflow

Conceptually:

```text
install-config.yaml
      ↓
openshift-install create manifests
      ↓
openshift-install create ignition-configs
      ├─ bootstrap.ign
      ├─ master.ign
      └─ worker.ign
```

Keep generated configuration out of public repositories when it contains sensitive material.

## 4. HAProxy

Validate:

```bash
haproxy -c -f /etc/haproxy/haproxy.cfg
systemctl status haproxy
ss -lntp | grep -E '6443|22623'
nc -zv <master-ip> 6443
nc -zv <master-ip> 22623
```

## 5. Bootstrap Troubleshooting

Use this sequence:

```text
DNS
 ↓
Routing
 ↓
Firewall
 ↓
HAProxy
 ↓
Ignition retrieval
 ↓
RHCOS boot
 ↓
Machine Config
 ↓
etcd
 ↓
Cluster Operators
```

Useful commands:

```bash
openshift-install wait-for bootstrap-complete --log-level=debug
openshift-install gather bootstrap --dir=<install-dir>
journalctl -b
```

## 6. Certificate/SAN Troubleshooting

```bash
openssl s_client -connect api.cluster.example.com:6443   -servername api.cluster.example.com </dev/null 2>/dev/null |
  openssl x509 -noout -subject -issuer -ext subjectAltName
```

Check for hostname/VIP/SAN mismatches.

## 7. Cluster Validation

```bash
oc get nodes
oc get clusteroperators
oc get clusterversion
oc get pods -A
oc get routes -A
oc get events -A --sort-by=.lastTimestamp
```

For a degraded operator:

```bash
oc describe clusteroperator <name>
```

## VMware Failure Points

Check NIC/port group, VLAN, MTU, routing, DNS, NTP, RHCOS disk/controller, Ignition reachability, API VIP and HAProxy backends.
