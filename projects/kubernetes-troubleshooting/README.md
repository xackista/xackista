# ☸️ Kubernetes Troubleshooting

## Pod

```bash
kubectl get pods -A -o wide
kubectl describe pod <pod> -n <namespace>
kubectl logs <pod> -n <namespace> --previous
kubectl get events -n <namespace> --sort-by=.lastTimestamp
```

## Service

```bash
kubectl get svc,endpoints -n <namespace>
```

Check selectors, endpoints, readiness and network policy.

## PVC

```bash
kubectl get pvc,pv -n <namespace>
kubectl describe pvc <name> -n <namespace>
kubectl get storageclass
```

Then inspect CSI logs and backend storage permissions.
