# 🔐 AIDE + auditd Security Baseline

## Objective
Extend the RHEL hardening baseline with file-integrity monitoring and security auditing using **AIDE and auditd**.

## AIDE Workflow

```text
Secure Baseline
      ↓
AIDE Database Initialization
      ↓
Scheduled Integrity Check
      ↓
Unexpected Change
      ↓
Investigate + Correlate with auditd
```

Initialize a baseline after the system is in an approved state:

```bash
aide --init
```

Review the generated database according to the distribution's AIDE configuration, then run integrity checks:

```bash
aide --check
```

Focus monitoring on security-sensitive locations such as `/etc`, authentication configuration, system binaries and other approved paths. Avoid blindly monitoring high-churn directories because that creates alert noise.

## auditd Workflow

Check service and status:

```bash
systemctl status auditd
auditctl -s
auditctl -l
```

Search recent authentication events:

```bash
ausearch -m USER_LOGIN -ts recent
```

Search AVC/security events:

```bash
ausearch -m AVC -ts recent
```

Generate a human-readable report:

```bash
aureport -au
```

## Example Audit Areas

Depending on the organization's policy, audit rules can cover:

- Authentication and account changes
- Privileged command execution
- Changes to security configuration
- Changes to identity databases
- Access to sensitive files
- Kernel/module activity
- Administrative actions

Rules should be designed around the actual security requirement and validated for performance and log volume.

## Investigation Model

```text
AIDE detects file change
        ↓
auditd identifies relevant event
        ↓
Correlate user / process / time
        ↓
Determine authorized vs unauthorized change
        ↓
Remediate and document
```

## Security Principle

AIDE and auditd are **detection and evidence controls**, not substitutes for preventive controls such as SELinux, least privilege, firewalling and secure authentication.

Never disable SELinux simply to make an application work. Investigate AVC denials, file contexts, booleans and policy requirements first.

## Skills Demonstrated

**RHEL | SELinux | auditd | AIDE | firewalld | SSH Hardening | Security Auditing | File Integrity Monitoring | Ansible**

## Portfolio Disclaimer

This is public lab/reference material. No employer credentials, customer information or proprietary configurations are included.
