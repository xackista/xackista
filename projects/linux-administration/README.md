# 🐧 Enterprise Linux Administration & Production Troubleshooting

## Client-Facing Summary

A production-oriented reference portfolio for diagnosing, stabilizing and maintaining RHEL-family and Ubuntu Linux servers. The focus is **root-cause analysis rather than trial-and-error fixes**.

## Problems Covered

- High CPU, memory, load average or I/O wait
- Failed or repeatedly restarting systemd services
- Filesystem and LVM capacity problems
- Network, DNS and connectivity failures
- Package/repository and dependency issues
- Boot and system startup problems
- Process, socket and port investigation
- Log analysis and incident triage
- Post-change validation and documentation

## Troubleshooting Workflow

```text
Symptom
  ↓
Collect Evidence
  ↓
Scope the Problem
  ↓
Identify Root Cause
  ↓
Implement Lowest-Risk Fix
  ↓
Validate
  ↓
Document / Prevent Recurrence
```

## Core Evidence Commands

```bash
top
ps aux --sort=-%cpu | head
free -h
vmstat 1 5
iostat -xz 1 5
ss -lntup
df -hT
lsblk
journalctl -p warning..alert -b
systemctl --failed
dmesg -T | tail -100
```

## Example: Filesystem / LVM Investigation

```bash
df -hT
lsblk
pvs
vgs
lvs
findmnt
```

Trace the path from physical disk → partition → PV → VG → LV → filesystem before expanding or modifying storage.

## Example: Service Failure

```bash
systemctl status <service>
journalctl -u <service> --since "30 min ago"
systemctl cat <service>
ss -lntup
```

Validate configuration, dependencies, ports, permissions, SELinux context and recent changes before restarting repeatedly.

## Production Safety Principles

- Preserve evidence before making changes.
- Prefer reversible changes where possible.
- Validate configuration before reload/restart.
- Keep existing administrative access available during network/SSH changes.
- Record the root cause and validation evidence.
- Never publish employer credentials, IPs, customer data or proprietary configuration.

## Skills Demonstrated

**RHEL | Rocky Linux | CentOS | Ubuntu | systemd | Bash | LVM | Filesystems | Networking | DNS | Performance Troubleshooting | Log Analysis**

## Business Value

The same workflow can be applied to production incidents, server health checks, migration preparation and recurring Linux administration tasks. The objective is faster recovery, safer changes and a documented root cause.
