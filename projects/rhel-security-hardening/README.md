# 🛡️ RHEL Security Hardening — SELinux, auditd, AIDE & Ansible

## Client-facing case study

A repeatable Linux security baseline for RHEL environments. The project demonstrates how to harden servers without turning security controls off when an application encounters a problem.

### Security controls demonstrated

**SELinux · firewalld · SSH hardening · auditd · AIDE · permissions · time synchronization · Ansible validation**

## 🎯 Hardening workflow

```text
Assess Current State
        ↓
Identify Required Services / Access
        ↓
Apply Security Baseline
        ↓
Validate SELinux / Firewall / Audit / Integrity Controls
        ↓
Test Required Application Paths
        ↓
Document Exceptions
```

## 1. Pre-check / evidence collection

```bash
cat /etc/redhat-release
getenforce
sestatus
systemctl is-active firewalld
systemctl is-active auditd
timedatectl
ss -lntup
```

Establish the baseline before changing controls so that security changes can be validated rather than assumed to work.

## 2. SELinux

```bash
getenforce
sestatus
ausearch -m AVC -ts recent
```

**Operational principle:** do not disable SELinux as the first response to an application failure. Investigate labels, contexts, booleans and policy denials first.

## 3. firewalld

```bash
firewall-cmd --state
firewall-cmd --get-active-zones
firewall-cmd --list-all
```

Only required services should be exposed. Example:

```bash
firewall-cmd --permanent --add-service=ssh
firewall-cmd --reload
```

Validate the resulting policy after reload.

## 4. SSH hardening

Inspect the effective configuration before modifying it:

```bash
sshd -T
```

Keep an existing administrative session open during SSH changes and validate configuration before reload.

## 5. auditd

```bash
systemctl status auditd
auditctl -s
ausearch -m USER_LOGIN -ts recent
```

Use audit evidence to investigate authentication and security-relevant activity rather than relying only on application logs.

## 6. AIDE integrity monitoring

Typical workflow:

```bash
aide --init
aide --check
```

The baseline should be established only after the system has reached the intended state. Review changes before treating them as expected.

## 7. Ansible repeatability

```bash
ansible-playbook --syntax-check site.yml
ansible-playbook site.yml --check --diff
ansible-playbook site.yml
```

Post-check:

```bash
ansible rhel -m command -a 'getenforce'
ansible rhel -m command -a 'systemctl is-active firewalld'
ansible rhel -m command -a 'systemctl is-active auditd'
```

## 🔐 Security principles

- Least privilege
- Minimal exposed services
- SELinux enforcing where supported by the workload
- Auditable administrative access
- Integrity monitoring
- Repeatable configuration
- Evidence-based exception handling
- Validation after every material change

## 💼 Client value

Useful for Linux security baselining, server hardening, CIS-oriented preparation, remediation planning, repeatable configuration and security-focused troubleshooting.

**Skills:** RHEL · Linux Security · SELinux · auditd · AIDE · firewalld · SSH · Ansible · Hardening · Security Baselines
