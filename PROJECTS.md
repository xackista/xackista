# Portfolio Project Index

This repository is designed as a technical evidence portfolio for infrastructure, Linux, security and DevOps services.

## ⭐ Client-Facing Portfolio

| Project | Demonstrates | Best for Upwork jobs |
|---|---|---|
| [Linux Administration](projects/linux-administration) | RHEL/Linux operations, performance and root-cause troubleshooting | Linux admin, server troubleshooting |
| [RHEL Security Hardening](projects/rhel-security-hardening) | SELinux, firewalld, SSH, auditd, AIDE and Ansible | Linux security, CIS hardening, compliance |
| [Kubernetes HA](projects/kubernetes-ha-lab) | HA control plane, API VIP, RBAC, workloads, storage and troubleshooting | Kubernetes administration |
| [OpenShift on VMware](projects/openshift-vmware) | UPI, RHCOS, Ignition, DNS, HAProxy, certificates and VMware | OpenShift, Kubernetes platform deployment |
| [VMware HA/DRS + SAN](projects/vmware-ha-drs-san) | vSphere, HA, DRS, VMkernel, SAN and multipathing | VMware, ESXi, vCenter, storage |
| [Infrastructure Automation](projects/infrastructure-automation) | Ansible roles, Terraform modules, Linux baseline and security automation | Ansible, Terraform, DevOps automation |
| [Ceph + Kubernetes CSI](projects/ceph-kubernetes-csi) | RBD, CSI, CephX and storage troubleshooting | Ceph, Kubernetes storage |
| [Monitoring](projects/monitoring-stack) | Prometheus, Grafana, alerting and incident runbooks | Monitoring, observability |

## 🧩 Architecture & Evidence Layer

The portfolio now includes architecture and operational evidence alongside the implementation files:

- [Enterprise Infrastructure Architecture](docs/architecture/enterprise-infrastructure.md) — how VMware, Linux, Kubernetes/OpenShift, Ceph, automation, security and monitoring fit together.
- [Kubernetes Architecture](projects/kubernetes-ha-platform/ARCHITECTURE.md) — HA control plane, etcd, workloads, CSI and troubleshooting flows.
- [OpenShift UPI on VMware](projects/openshift-vmware/ARCHITECTURE.md) — RHCOS, Ignition, DNS, HAProxy/Keepalived and certificate troubleshooting.
- [VMware HA/DRS + SAN](projects/vmware-ha-drs-san/ARCHITECTURE.md) — cluster, HA/DRS, VMkernel and SAN relationships.
- [Ceph CSI Troubleshooting](projects/ceph-kubernetes-csi/TROUBLESHOOTING.md) — representative storage failure investigation.
- [Monitoring Evidence Guide](projects/monitoring-stack/dashboards/README.md) — lab screenshot and dashboard evidence standards.

## 🔧 Additional Case Studies

| Project | Focus |
|---|---|
| [Pacemaker HA](projects/pacemaker-ha) | Corosync, Pacemaker, fencing and resource recovery |
| [Ansible Patch Management](projects/ansible-patch-management) | Controlled patching and validation |
| [Terraform VMware](projects/terraform-vmware) | VMware Infrastructure-as-Code |
| [Linux Performance](projects/linux-performance-case-study) | Evidence-driven incident response |
| [Backup Troubleshooting](projects/backup-troubleshooting) | Backup control/data-path investigation |
| [Kubernetes Troubleshooting](projects/kubernetes-troubleshooting) | Pods, nodes, networking, scheduling and storage |
| [Container CI/CD](projects/cicd-container-pipeline) | Build, scan, deploy and rollback concepts |

## Suggested Client Reading Order

**Linux Administration → RHEL Security → Kubernetes → VMware/SAN → OpenShift → Automation → Monitoring → Ceph**

The first three establish the core service offering; the remaining projects demonstrate senior-level breadth and specialized capabilities.

> **Evidence policy:** This repository intentionally separates verified experience from public lab/reference material. No fabricated production screenshots, client names, credentials, proprietary configurations or unsupported performance claims are used.
