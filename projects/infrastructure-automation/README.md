# ⚙️ Infrastructure Automation with Ansible & Terraform

## Client-Facing Summary

A production-oriented automation reference showing how infrastructure provisioning and Linux configuration can be made **repeatable, auditable and safer to operate**.

## Automation Model

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
Application / Service Configuration
   ↓
Monitoring
   ↓
Validation
```

## Ansible Use Cases

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

## Terraform Use Cases

- VM provisioning where the target virtualization provider supports it
- Repeatable infrastructure definitions
- Variables and environment separation
- Reusable modules
- Infrastructure lifecycle documentation

## Safe Automation Workflow

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
Report
```

Example Ansible validation:

```bash
ansible-playbook --syntax-check site.yml
ansible-playbook site.yml --check --diff
ansible-playbook site.yml
```

## Security-First Configuration

Automation should not only configure a server; it should establish a consistent security baseline. Examples include:

- SELinux enforcing mode
- firewalld policy
- SSH hardening
- auditd rules
- AIDE integrity monitoring
- least-privilege accounts
- time synchronization
- controlled package repositories

## Design Principles

- Idempotent configuration
- Version-controlled infrastructure
- Least privilege
- Small blast radius
- Explicit variables and secrets management
- Pre/post validation
- Documented rollback considerations

## Skills Demonstrated

**Ansible | Terraform | RHEL | Linux | Bash | Python | Infrastructure-as-Code | Security Hardening | Patch Automation | Configuration Management**

## Business Value

Automation reduces configuration drift, improves consistency, shortens deployment time and makes infrastructure changes easier to audit and reproduce.
