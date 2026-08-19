# 🟢 Pacemaker + Corosync HA Cluster

## Objective
Demonstrate Linux HA concepts using Corosync for membership/communication and Pacemaker for resource management.

## Architecture
```text
        Application Resource
             |         |
          Node-01    Node-02
              \       /
              Cluster
                 |
          Fencing/STONITH
```

## Components

- **Corosync:** cluster communication and membership.
- **Pacemaker:** resource placement/recovery.
- **STONITH:** safely isolates failed nodes.
- **Resource agents:** standard service control interfaces.

## Commands

```bash
pcs status
pcs status --full
pcs resource status
pcs resource config
pcs constraint config
pcs property config
pcs stonith status
pcs config
```

Services:

```bash
systemctl status pacemaker
systemctl status corosync
```

## Failed Resource

```bash
pcs resource failures
```

After identifying the cause, a resource can be cleaned up:

```bash
pcs resource cleanup <resource>
```

Do not repeatedly clean up a resource without understanding why it failed.

Investigate node state, fencing, constraints, resource-agent output, storage and application logs.
