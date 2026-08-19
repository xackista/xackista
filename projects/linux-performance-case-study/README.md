# 🔎 Linux Performance Troubleshooting Case Study

## Scenario
A Linux server is reported as slow. Diagnose it from evidence rather than restarting services immediately.

## Load

```bash
uptime
cat /proc/loadavg
nproc
```

## CPU

```bash
top
mpstat -P ALL 1 5
```

Look at user, system, iowait, steal and idle.

## Memory

```bash
free -h
vmstat 1 5
```

Distinguish application memory pressure from Linux page cache.

## I/O

```bash
iostat -xz 1 5
iotop
```

Investigate latency, utilization and queue depth.

## Blocked Processes

```bash
ps -eo state,pid,ppid,cmd --sort=state | head -50
```

`D` state often means the process is waiting in uninterruptible kernel I/O.

## Filesystem and Logs

```bash
df -h
df -i
findmnt
journalctl -p warning..alert --since "1 hour ago"
dmesg -T | tail -200
```

Look for I/O errors, filesystem failures, device resets, OOM events and storage/network problems.

## Example Reasoning

```text
High load
 + low CPU utilization
 + many D-state processes
 + high disk latency
        ↓
Investigate storage path
        ↓
SAN / NFS / multipath / filesystem
```

The objective is root-cause identification, validation and prevention—not simply lowering the load average.
