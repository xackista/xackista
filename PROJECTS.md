# Infrastructure Engineering Portfolio — Project Index

This repository is organized as a **client-facing evidence portfolio** for Linux, infrastructure, virtualization, Kubernetes/OpenShift, security, storage and automation services.

## ⭐ Core Client Evidence

| Project | Client problem demonstrated | Best-fit work |
|---|---|---|
| [Linux Administration](projects/linux-administration) | Production Linux failures, performance, storage, networking and services | Linux/RHEL administration, troubleshooting |
| [RHEL Security Hardening](projects/rhel-security-hardening) | Linux security baseline and hardening requirements | SELinux, auditd, AIDE, CIS-oriented hardening |
| [Kubernetes HA](projects/kubernetes-ha-lab) | Reliable Kubernetes platform and workload operations | Kubernetes administration |
| [OpenShift on VMware](projects/openshift-vmware) | Enterprise OpenShift deployment and platform troubleshooting | OpenShift, RHCOS, VMware |
| [VMware HA/DRS + SAN](projects/vmware-ha-drs-san) | Virtualization, availability and enterprise storage | VMware, ESXi, vCenter, SAN |
| [Infrastructure Automation](projects/infrastructure-automation) | Repetitive manual infrastructure administration | Ansible, Terraform, Bash, automation |
| [Ceph + Kubernetes CSI](projects/ceph-kubernetes-csi) | Persistent storage provisioning and storage failures | Ceph, CSI, Kubernetes storage |
| [Monitoring](projects/monitoring-stack) | Lack of infrastructure visibility and actionable alerting | Prometheus, Grafana, Zabbix |

## 🔎 Supporting Case Studies

- [Linux Performance](projects/linux-performance-case-study) — evidence-driven performance investigation
- [Kubernetes Troubleshooting](projects/kubernetes-troubleshooting) — pods, nodes, scheduling, networking and storage failures
- [Ansible Patch Management](projects/ansible-patch-management) — controlled patching and validation
- [Terraform VMware](projects/terraform-vmware) — VMware infrastructure-as-code
- [Pacemaker HA](projects/pacemaker-ha) — Corosync, Pacemaker, fencing and recovery
- [Backup Troubleshooting](projects/backup-troubleshooting) — structured backup failure investigation
- [Container CI/CD](projects/cicd-container-pipeline) — build, scan, deploy and rollback concepts

## 🏗️ Architecture Evidence

- [Enterprise Infrastructure Architecture](docs/architecture/enterprise-infrastructure.md) — relationship between virtualization, Linux, Kubernetes/OpenShift, storage, automation, security and monitoring.
- [Kubernetes Architecture](projects/kubernetes-ha-platform/ARCHITECTURE.md) — control plane, etcd, workloads, CSI and troubleshooting flows.
- [OpenShift UPI on VMware](projects/openshift-vmware/ARCHITECTURE.md) — RHCOS, Ignition, DNS, HAProxy/Keepalived and certificate dependencies.
- [VMware HA/DRS + SAN](projects/vmware-ha-drs-san/ARCHITECTURE.md) — cluster, HA/DRS, VMkernel and SAN relationships.
- [Ceph CSI Troubleshooting](projects/ceph-kubernetes-csi/TROUBLESHOOTING.md) — representative storage failure investigation.
- [Monitoring Evidence Guide](projects/monitoring-stack/dashboards/README.md) — dashboard and evidence standards.

## 🧭 Recommended Reading Paths

**Linux client:** Linux Administration → Linux Performance → RHEL Security

**VMware client:** VMware HA/DRS + SAN → Terraform VMware → Linux Administration

**Kubernetes client:** Kubernetes HA → Kubernetes Troubleshooting → Ceph + Kubernetes CSI

**OpenShift client:** OpenShift on VMware → Kubernetes HA → Infrastructure Automation

**Security client:** RHEL Security → Linux Administration → Ansible Patch Management

**Automation client:** Infrastructure Automation → Terraform VMware → Ansible Patch Management

## Evidence Standard

Every major case study should progressively expose the same decision-making chain:

**Problem → Environment → Evidence → Diagnosis → Root Cause → Remediation → Validation → Prevention**

Public material is intentionally separated from professional production experience. No fabricated client screenshots, credentials, customer data, private infrastructure details or unsupported performance claims are included.
