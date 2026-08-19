# 💾 Ceph + Kubernetes CSI

```text
Pod -> PVC -> CSI Provisioner -> Ceph CSI -> RBD -> Ceph Cluster
```

Validate:

```bash
ceph -s
ceph health detail
ceph osd tree
kubectl get csidrivers
kubectl get pvc,pv
kubectl describe pvc <name>
```

For `EPERM` / `ret=-13`, investigate CephX identity/capabilities, pool permissions, network access and CSI configuration.
