# 🤖 Ansible Enterprise Patch Management

## Objective
Automate Linux patching while minimizing blast radius and providing pre/post validation.

## Workflow
```text
Inventory → Pre-check → Patch small batch → Reboot → Health check → Next batch → Report
```

## Pre-checks

```bash
ansible linux -m ping
ansible linux -m command -a 'uptime'
ansible linux -m command -a 'df -h'
ansible linux -m command -a 'uname -r'
ansible linux -m shell -a 'systemctl --failed'
```

## Dry Run

```bash
ansible-playbook site.yml --check --diff
```

## Controlled Rollout

The playbook uses:

```yaml
serial: 1
```

Process one node at a time initially. Increase the batch only after the workflow is proven.

## Patch

```bash
ansible-playbook site.yml
```

## Post-check

```bash
ansible linux -m ping
ansible linux -m command -a 'uname -r'
ansible linux -m shell -a 'systemctl --failed'
```

Production considerations include maintenance windows, cluster sequencing, application dependencies, reboot requirements, repository availability, rollback strategy and change approval.
