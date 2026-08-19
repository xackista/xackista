# Linux Troubleshooting Quick Reference

```bash
uptime
top
free -h
df -h
df -i
vmstat 1 5
iostat -xz 1 5
ps -eo state,pid,ppid,cmd --sort=state | head -50
journalctl -p warning..alert --since "30 min ago"
dmesg -T | tail -100
```

If CPU is low but load is high, investigate I/O and processes in `D` state. Correlate storage, NFS/SAN, filesystem and application evidence before disruptive changes.
