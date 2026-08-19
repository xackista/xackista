# 🖥️ VMware HA/DRS + SAN — Infrastructure Design Lab

## Objective
Demonstrate the complete virtualization stack: vCenter, ESXi, cluster availability, DRS, VMkernel networking, SAN LUNs, datastores and multipathing.

## Architecture
```text
                     vCenter
                    /        \
                ESXi-01    ESXi-02
                   |          |
              VMkernel    VMkernel
                   \          /
                    SAN Fabric
                        |
                    SAN Array
                        |
                    VMFS Datastore
```

## VMkernel Checks

```bash
esxcli network ip interface list
esxcli network ip interface ipv4 get
esxcli network nic list
```

Typical logical networks:

```text
Management
vMotion
Storage/iSCSI/NFS
Fault Tolerance (where used)
```

## SAN Visibility

```bash
esxcli storage core adapter list
esxcli storage core path list
esxcli storage filesystem list
esxcli storage nmp device list
```

Trace a storage issue:

```text
HBA → Fabric → Zoning → Array Masking → LUN → ESXi Path → Datastore
```

## vSphere HA

HA restarts eligible VMs after host failure.

Design questions:

- Is spare capacity sufficient?
- Is admission control configured?
- Are restart priorities appropriate?
- Is datastore accessibility redundant?
- Are isolation responses suitable?

## DRS

DRS optimizes VM placement for resource balance and policy compliance.

Review host/VM placement and DRS recommendations in vCenter.

## Datastore Checks

```bash
esxcli storage filesystem list
esxcli storage vmfs extent list
```

## Troubleshooting Example: Datastore Missing

```bash
esxcli storage core device list
esxcli storage core path list
esxcli storage nmp device list
```

Determine whether the problem is LUN visibility, path failure, zoning, masking, HBA or array-side before taking corrective action.
