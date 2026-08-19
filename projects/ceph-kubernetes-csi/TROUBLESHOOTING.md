# Ceph + Kubernetes CSI — Troubleshooting Scenarios

## Provisioning fails with RADOS permission denied

A CSI provisioner error such as `rados ret=-13` should be treated as an authorization problem first.

### Investigation

```bash
kubectl -n <namespace> logs <csi-provisioner-pod>
ceph -s
ceph health detail
ceph auth list
```

Check:

- CephX identity used by the CSI secret.
- Key capabilities for the target pool.
- Correct monitor endpoints.
- Namespace and secret reference.
- Pool/application configuration.

Do not immediately recreate the cluster or delete PVCs.

## PVC remains Pending

```bash
kubectl describe pvc <pvc> -n <namespace>
kubectl get storageclass
kubectl get pods -A | grep -i csi
```

Follow the event chain from PVC → StorageClass → CSI controller → Ceph.

## Ceph health warning

```bash
ceph -s
ceph health detail
ceph osd tree
ceph osd df
ceph df
```

Classify the warning before remediation: OSD failure, degraded PGs, capacity pressure, daemon crash, network issue or authentication/configuration problem.

## Evidence discipline

This document intentionally uses representative errors and commands. It does not claim a specific production incident unless separately documented with verifiable evidence.
