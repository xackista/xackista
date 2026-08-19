# Kubernetes Command Reference

## Cluster
```bash
kubectl cluster-info
kubectl get nodes -o wide
kubectl get pods -A
kubectl get events -A --sort-by=.lastTimestamp
```

## Workloads
```bash
kubectl get deploy,rs,pods -A
kubectl describe pod <pod> -n <namespace>
kubectl logs <pod> -n <namespace>
kubectl logs <pod> -n <namespace> --previous
kubectl rollout status deployment/<name> -n <namespace>
kubectl rollout history deployment/<name> -n <namespace>
```

## Networking
```bash
kubectl get svc,endpoints,endpointslices -A
kubectl get networkpolicy -A
```

## Storage
```bash
kubectl get sc
kubectl get pvc,pv -A
kubectl describe pvc <name> -n <namespace>
```

## RBAC
```bash
kubectl auth can-i --list
kubectl auth can-i get pods -n <namespace>
kubectl get role,rolebinding,clusterrole,clusterrolebinding -A
```

## YAML
```bash
kubectl apply -f manifest.yaml
kubectl diff -f manifest.yaml
kubectl delete -f manifest.yaml
```
