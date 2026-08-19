# 💿 Enterprise Backup Troubleshooting Case Study

## Scenario
A backup identifies a client but cannot establish the direct save/data path to a storage node.

## Architecture

```text
Client ─── control path ───> Backup Server
   |
   └────── data path ───────> Storage Node
```

## 1. DNS

```bash
getent hosts <backup-server>
getent hosts <storage-node>
hostname -f
```

## 2. Connectivity

```bash
ping -c 3 <backup-server>
ping -c 3 <storage-node>
```

## 3. Ports

```bash
nc -zv <backup-server> <port>
nc -zv <storage-node> <port>
```

Use the ports required by the installed backup product/version.

## 4. Routing

```bash
ip route
ip route get <storage-node-ip>
```

## 5. Firewall and Listeners

```bash
firewall-cmd --list-all
ss -lntup
```

## 6. Resource Contention

```bash
uptime
top
iostat -xz 1 5
```

Backup failures can be caused by storage contention even when network connectivity is healthy.

## 7. Logs

Correlate client, backup server, storage node, firewall and DNS evidence.

### Key Principle

Separate control-plane communication from data-plane communication. If client→server works but client→storage-node fails, restarting the backup server is unlikely to fix the real problem.
