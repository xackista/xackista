# ☸️ Kubernetes Troubleshooting Runbook

## Pod Pending

```bash
kubectl get pod <pod> -n <namespace> -o wide
kubectl describe pod <pod> -n <namespace>
kubectl get events -n <namespace> --sort-by=.lastTimestamp
```

Check requests, taints, tolerations, affinity, node selectors, PVCs and scheduler messages.

## CrashLoopBackOff

```bash
kubectl logs <pod> -n <namespace>
kubectl logs <pod> -n <namespace> --previous
kubectl describe pod <pod> -n <namespace>
```

Check configuration, environment variables, Secrets, probes and application exit codes.

## ImagePullBackOff

```bash
kubectl describe pod <pod> -n <namespace>
```

Check image/tag, registry DNS/networking, ImagePullSecrets and TLS/authentication.

## Service Unreachable

```bash
kubectl get svc -n <namespace>
kubectl get endpoints,endpointslices -n <namespace>
kubectl get pods --show-labels -n <namespace>
```

Trace:

```text
Service → Selector → EndpointSlice → Pod IP → Container listener
```

## PVC Pending

```bash
kubectl get pvc,pv -n <namespace>
kubectl describe pvc <pvc> -n <namespace>
kubectl get storageclass
```

Then inspect CSI controller/node logs and backend storage health.

## Node NotReady

```bash
kubectl describe node <node>
systemctl status kubelet
journalctl -u kubelet -n 200
df -h
free -h
```

Check disk pressure, memory pressure, runtime, CNI, certificates and kubelet health.

## NetworkPolicy

```bash
kubectl get networkpolicy -A
kubectl describe networkpolicy <name> -n <namespace>
```

If DNS works but the application does not, inspect policies and CNI behavior before assuming the application is down.
