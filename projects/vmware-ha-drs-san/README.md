# 🖥️ VMware HA/DRS + SAN — Enterprise Virtualization Evidence

## Client-facing case study

This project demonstrates the reasoning required to administer and troubleshoot a VMware vSphere environment spanning **vCenter, ESXi, HA, DRS, VMkernel networking, SAN LUNs, datastores and multipathing**.

## 🏗️ Architecture

```text
                         vCenter
                        /       \
                    ESXi-01   ESXi-02
                       |         |
                   VMkernel   VMkernel
                       \         /
                        SAN Fabric
                            |
                         SAN Array
                            |
                       VMFS Datastore
```

## 🎯 What a client can verify here

- vSphere cluster and host relationships
- HA versus DRS operational roles
- VMkernel network separation
- SAN visibility and multipathing
- Datastore investigation
- Evidence-driven storage troubleshooting
- Capacity and availability considerations

## 🌐 VMkernel investigation

```bash
esxcli network ip interface list
esxcli network ip interface ipv4 get
esxcli network nic list
```

Typical logical networks:

```text
Management
vMotion
Storage / iSCSI / NFS
Fault Tolerance (where used)
```

## 💾 SAN troubleshooting path

```text
HBA
 ↓
Fabric / Zoning
 ↓
Array Masking
 ↓
LUN
 ↓
ESXi Device
 ↓
Multipathing
 ↓
Datastore
```

Useful evidence:

```bash
esxcli storage core adapter list
esxcli storage core path list
esxcli storage filesystem list
esxcli storage nmp device list
```

This prevents jumping directly to datastore changes before establishing whether the problem is HBA, fabric, zoning, masking, LUN visibility or path state.

## 🟢 VMware HA

HA provides VM restart protection after eligible host failures.

Operational questions include:

- Is sufficient failover capacity available?
- Is admission control appropriate?
- Are VM restart priorities sensible?
- Are datastores accessible after host failure?
- Are isolation responses appropriate?

## ⚖️ VMware DRS

DRS evaluates host/VM placement to improve resource balance and enforce placement policies.

Review host capacity, VM reservations/limits, affinity rules and DRS recommendations before forcing manual placement changes.

## 🗄️ Datastore investigation

```bash
esxcli storage filesystem list
esxcli storage vmfs extent list
```

### Example: datastore missing

```bash
esxcli storage core device list
esxcli storage core path list
esxcli storage nmp device list
```

Determine the failing layer before corrective action.

## 💼 Client value

This evidence is relevant to VMware administration, ESXi/vCenter troubleshooting, cluster availability, storage incidents, SAN connectivity, VM performance investigations and virtualization design reviews.

**Skills:** VMware vSphere · ESXi · vCenter · HA · DRS · VMkernel · SAN · LUN · VMFS · Multipathing · Storage Troubleshooting
