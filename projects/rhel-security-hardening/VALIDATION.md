# RHEL Security Validation

The goal is to demonstrate that hardening was applied and then verified.

## SELinux

```bash
getenforce
sestatus
ausearch -m AVC -ts recent
```

Expected baseline: enforcing, with AVC denials investigated rather than blindly suppressed.

## SSH

```bash
sshd -T | egrep 'permitrootlogin|passwordauthentication|pubkeyauthentication|x11forwarding'
```

Validate effective configuration, not only the contents of `sshd_config`.

## Firewall

```bash
firewall-cmd --state
firewall-cmd --list-all
ss -lntup
```

Compare exposed listeners against the intended service inventory.

## auditd

```bash
systemctl is-active auditd
auditctl -s
auditctl -l
```

## AIDE

```bash
systemctl is-enabled aidecheck.timer 2>/dev/null || true
aide --check
```

## Security validation principle

A security control is not complete when a configuration file has been edited. It is complete when the effective state has been checked, exceptions are understood, and the control can be monitored over time.
