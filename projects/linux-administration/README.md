# 🐧 Enterprise Linux Administration & Production Troubleshooting

## Client-facing case study

This project demonstrates an evidence-driven workflow for diagnosing and stabilizing RHEL-family and Ubuntu Linux servers. It is designed around the type of incidents clients hire a senior Linux engineer to resolve: slow servers, failed services, storage problems, network/DNS failures, package issues and unexplained instability.

### Problems covered

- High CPU, memory pressure, load average and I/O wait
- Failed or repeatedly restarting systemd services
- Filesystem and LVM capacity problems
- Network, DNS and connectivity failures
- Package/repository and dependency problems
- Boot and startup failures
- Process, socket and port investigation
- Log and kernel-message analysis
- Incident triage and post-change validation

## 🔎 Troubleshooting method

```text
Client Symptom
      ↓
Collect Evidence
      ↓
Scope the Failure
      ↓
Correlate OS / Storage / Network / Application Signals
      ↓
Identify Root Cause
      ↓
Choose Lowest-Risk Remediation
      ↓
Validate
      ↓
Document & Prevent Recurrence
```

The objective is not to restart services repeatedly or change configuration blindly. Preserve evidence first, isolate the failing layer, make a controlled change and prove that the fix worked.

## 🧰 Core investigation commands

```bash
top
ps aux --sort=-%cpu | head
free -h
vmstat 1 5
iostat -xz 1 5
ss -lntup
df -hT
lsblk
pvs
vgs
lvs
findmnt
journalctl -p warning..alert -b
systemctl --failed
dmesg -T | tail -100
```

## 💾 Storage / LVM investigation

Trace the complete storage path before modifying capacity:

```text
Disk → Partition → PV → VG → LV → Filesystem → Mount
```

Useful checks:

```bash
df -hT
lsblk
pvs
vgs
lvs
findmnt
```

The same workflow supports filesystem-full incidents, LVM expansion planning, mount failures and storage-impact analysis.

## ⚙️ Service failure investigation

```bash
systemctl status <service>
journalctl -u <service> --since "30 min ago"
systemctl cat <service>
ss -lntup
```

Before repeatedly restarting a service, validate configuration, dependencies, ports, permissions, SELinux context, filesystem capacity and recent changes.

## 🌐 Network / DNS investigation

```bash
ip addr
ip route
ss -lntup
getent hosts <hostname>
resolvectl status
ping <target>
```

The goal is to determine whether the failure is local configuration, routing, DNS, firewall policy, service binding or remote connectivity.

## 🛡️ Production safety principles

- Preserve evidence before making changes.
- Prefer reversible changes where possible.
- Validate configuration before reload/restart.
- Keep existing administrative access available during SSH/network changes.
- Consider SELinux and firewall policy before weakening security controls.
- Record root cause and validation evidence.
- Never publish employer credentials, private IPs, customer data or proprietary configuration.

## 💼 Client value

This workflow is applicable to production incident response, Linux health checks, migration preparation, recurring administration, capacity investigations and post-change validation.

**Skills:** RHEL · Rocky Linux · CentOS · Ubuntu · systemd · Bash · LVM · Filesystems · Networking · DNS · Performance Troubleshooting · Log Analysis · Incident Response
