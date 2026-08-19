# 🛡️ RHEL Security Hardening — Ansible Baseline

## Objective
Build a repeatable RHEL baseline covering SELinux, firewalld, SSH, auditd and time synchronization.

## Pre-check

```bash
cat /etc/redhat-release
getenforce
systemctl is-active firewalld
systemctl is-active auditd
timedatectl
ss -lntup
```

## SELinux

```bash
getenforce
sestatus
ausearch -m AVC -ts recent
```

Do not disable SELinux as a first response to an application failure. Investigate labels, booleans and policy denials.

## firewalld

```bash
firewall-cmd --state
firewall-cmd --get-active-zones
firewall-cmd --list-all
```

Open only required services:

```bash
firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload
```

## SSH

```bash
sshd -T
```

Keep an existing session open when changing SSH. Validate configuration before reload.

## auditd

```bash
systemctl status auditd
auditctl -s
ausearch -m USER_LOGIN -ts recent
```

## Ansible Validation

```bash
ansible-playbook --syntax-check site.yml
ansible-playbook site.yml --check --diff
ansible-playbook site.yml
```

Post-check:

```bash
ansible rhel -m command -a 'getenforce'
ansible rhel -m command -a 'systemctl is-active firewalld'
```

The goal is repeatable and auditable hardening, not one-off manual changes.
