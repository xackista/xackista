# 🖥️ VMware HA/DRS + SAN

```text
vCenter
  |
+-----------+
|           |
ESXi-01   ESXi-02
|           |
+-----+-----+
      |
   SAN Fabric
      |
   SAN Array
```

Covers vSphere HA, DRS, VMkernel networking, management/vMotion/storage networks, VLANs, SAN LUNs, datastores and multipathing.

```bash
esxcli storage core path list
esxcli storage filesystem list
esxcli storage nmp device list
```
