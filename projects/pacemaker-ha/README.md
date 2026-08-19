# 🟢 Pacemaker / Corosync HA

Corosync provides membership/communication; Pacemaker manages resources; fencing/STONITH safely isolates failed nodes.

```bash
pcs status
pcs resource status
pcs constraint config
pcs property config
```

A production HA design should include tested fencing and clearly defined resource dependencies.
