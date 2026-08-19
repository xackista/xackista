# 🛡️ RHEL Security Hardening

Ansible baseline covering SELinux, firewalld, SSH, auditd and chrony.

Validation:

```bash
getenforce
systemctl is-active firewalld
systemctl is-active auditd
sshd -T
auditctl -s
```

Always test hardening against application dependencies before production enforcement.
