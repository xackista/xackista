# Linux Administration Command Reference

## System
```bash
hostnamectl
cat /etc/redhat-release
uname -r
uptime
who
last
```

## CPU / Memory
```bash
lscpu
free -h
vmstat 1 5
top
ps aux --sort=-%cpu | head
ps aux --sort=-%mem | head
```

## Storage
```bash
lsblk
blkid
df -hT
df -i
findmnt
iostat -xz 1 5
pvs
vgs
lvs
```

## Network
```bash
ip addr
ip route
ss -lntup
nmcli connection show
nmcli device status
```

## Services / Logs
```bash
systemctl --failed
systemctl status <service>
journalctl -u <service>
journalctl -p warning..alert
```

## Security
```bash
getenforce
sestatus
firewall-cmd --list-all
ausearch -m AVC -ts recent
sshd -T
```
