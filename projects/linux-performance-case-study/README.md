# 🔎 Linux Performance Incident Case Study

## Evidence collection

```bash
uptime
top -b -n1
free -h
vmstat 1 5
iostat -xz 1 5
ps -eo state,pid,ppid,cmd --sort=state | head -50
df -h
journalctl -p warning..alert --since "30 min ago"
```

High load does not automatically mean CPU saturation. If CPU is mostly idle, investigate I/O and blocked `D`-state processes. Correlate storage, filesystem, SAN/NFS and application evidence.

A professional deliverable includes symptoms, timeline, evidence, root cause, remediation, validation and prevention.
