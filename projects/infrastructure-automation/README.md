# ⚙️ Infrastructure Automation — Ansible + Terraform

## Client-facing case study

A security-aware infrastructure automation pattern for turning repeatable Linux and VMware operations into version-controlled, auditable workflows.

The goal is not automation for its own sake. The goal is **less configuration drift, safer changes, consistent baselines and easier recovery**.

## 🏗️ Automation model

```text
Terraform
   ↓
Infrastructure Provisioning
   ↓
Ansible Inventory
   ↓
Linux Baseline
   ↓
Security Hardening
   ↓
Service / Application Configuration
   ↓
Monitoring
   ↓
Validation
```

## 🧰 Ansible use cases

- Linux baseline configuration
- Package installation and updates
- Users and SSH configuration
- firewalld configuration
- SELinux configuration
- auditd deployment
- AIDE configuration
- Service management
- Monitoring agent deployment
- Controlled patching

## 🏗️ Terraform use cases

- Repeatable VM provisioning where the provider supports it
- Infrastructure definitions as code
- Variables and environment separation
- Reusable modules
- Infrastructure lifecycle documentation

## 🛡️ Safe automation workflow

```text
Plan
 ↓
Syntax / Lint Validation
 ↓
Check / Dry Run
 ↓
Small Scope
 ↓
Apply
 ↓
Post-Checks
 ↓
Report / Rollback if Required
```

Example validation:

```bash
ansible-playbook --syntax-check site.yml
ansible-playbook site.yml --check --diff
ansible-playbook site.yml
```

## 🔐 Security-first automation

Automation should establish a consistent security baseline as part of normal configuration management:

- SELinux enforcing where appropriate
- firewalld policy
- SSH hardening
- auditd rules
- AIDE integrity monitoring
- least-privilege accounts
- time synchronization
- controlled package repositories
- explicit secrets-management boundaries

## 🧠 Engineering principles

- Idempotent configuration
- Version-controlled infrastructure
- Least privilege
- Small blast radius
- Explicit variables
- Secrets kept outside source control
- Pre/post validation
- Documented rollback considerations
- Reusable roles/modules rather than copy-paste configuration

## 💼 Client value

Useful for server fleet standardization, VM provisioning, secure Linux baselines, patch automation, configuration drift reduction, repeatable deployments and infrastructure-as-code initiatives.

**Skills:** Ansible · Terraform · RHEL · Linux · VMware · Bash · Python · Infrastructure-as-Code · Configuration Management · Security Hardening · Patch Automation
