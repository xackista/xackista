# 💿 Enterprise Backup Troubleshooting

```text
Client
 |-- Control path --> Backup Server
 |-- Data path -----> Storage Node
```

Validate DNS, both communication paths, firewall ports, storage-node availability, client configuration, concurrent resource contention, services and logs.

Do not label every backup failure a network problem: separate control-plane and data-plane communication and test each hop.
