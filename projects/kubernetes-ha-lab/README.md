# ☸️ Kubernetes HA Lab

## Architecture

```text
                 HAProxy / API VIP
                         |
          +--------------+--------------+
          |              |              |
       master1        master2        master3
          |              |              |
          +--------------+--------------+
                         |
                    worker1/2
```

Demonstrates HA control-plane design, stable API access, workloads, RBAC, storage, ingress and operational checks.

```bash
kubectl get nodes -o wide
kubectl get pods -A
kubectl get --raw='/readyz?verbose'
kubectl get events -A --sort-by=.lastTimestamp
```
