# 💾 Ceph + Kubernetes CSI — Storage Integration Lab

## Objective
Integrate Kubernetes persistent storage with Ceph using CSI and troubleshoot provisioning failures from the Kubernetes layer down to CephX permissions.

## Architecture
```text
Pod → PVC → CSI Provisioner → Ceph CSI → RBD → Ceph MON/OSD
```

## 1. Ceph Health

```bash
ceph -s
ceph health detail
ceph df
ceph osd tree
ceph osd df
```

Investigate Ceph health before troubleshooting Kubernetes.

## 2. Pools and Authentication

```bash
ceph osd pool ls
ceph osd pool get <pool> size
ceph osd pool get <pool> min_size
ceph auth ls
ceph auth get client.<name>
```

Grant only the capabilities required by the CSI identity.

## 3. CSI Validation

```bash
kubectl get csidrivers
kubectl get pods -n <ceph-csi-namespace>
kubectl get storageclass
kubectl get pvc,pv
kubectl get events -A --sort-by=.lastTimestamp
```

Inspect a PVC:

```bash
kubectl describe pvc <pvc> -n <namespace>
```

## 4. Test Provisioning

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ceph-test
spec:
  accessModes: [ReadWriteOnce]
  storageClassName: <ceph-rbd-storageclass>
  resources:
    requests:
      storage: 5Gi
```

```bash
kubectl apply -f pvc.yaml
kubectl get pvc ceph-test
kubectl describe pvc ceph-test
```

## 5. Permission Error Troubleshooting

If CSI reports:

```text
rados ret=-13
permission denied
```

treat it as an authorization problem first.

Trace:

```text
Kubernetes Secret
      ↓
CephX identity
      ↓
CephX capabilities
      ↓
Pool permissions
      ↓
Ceph MON connectivity
      ↓
OSD/backend health
```

Inspect CSI logs:

```bash
kubectl logs -n <namespace> deploy/<csi-provisioner>
kubectl logs -n <namespace> <csi-node-pod>
```

## 6. RBD

```bash
rbd pool ls
rbd ls <pool>
rbd info <pool>/<image>
ceph osd stat
ceph osd tree
```

The key operational skill is separating Kubernetes object state, CSI components, authentication, networking and storage backend health.
