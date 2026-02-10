<div align="center">
  <h1>Hi 👋, I'm Zaki — Platform / Systems / DevOps Engineer</h1>
  <p>
    <strong>Building reliable, scalable infrastructure • Kubernetes • OpenShift • Ceph • GitOps</strong>
  </p>

  <!-- Badges -->
  <p>
    <img src="https://img.shields.io/badge/Kubernetes-Expert-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white" />
    <img src="https://img.shields.io/badge/OpenShift-Administrator-red?style=for-the-badge&logo=redhatopenshift&logoColor=white" />
    <img src="https://img.shields.io/badge/Ceph-Storage_Expert-9900ff?style=for-the-badge&logo=ceph&logoColor=white" />
    <img src="https://img.shields.io/badge/Platform_Engineering-Production_Grade-00C4B4?style=for-the-badge" />
  </p>
</div>

## 🛠️ What I've Built & Operated

| Project | Description | Technologies | Status |
|--------|-------------|--------------|--------|
| **Production-grade Ceph Storage Cluster** | Deployed 3–node Ceph (or 5–node) cluster with proper CRUSH maps, PG tuning, RGW, CephFS, RBD | Ceph, Rook or manual, monitoring (Prometheus + Grafana) | [Repo →](https://github.com/yourusername/ceph-production-cluster) |
| **Vanilla Kubernetes Cluster from Scratch** | Kubeadm / kops / manual HA control-plane, Calico / Cilium CNI, metrics-server, cluster autoscaler prep | kubeadm, containerd/CRI-O, kubectl, Helm | [Repo →](https://github.com/yourusername/kubernetes-homelab-prodgrade) |
| **OpenShift 4.x Cluster** | Installed & configured OpenShift (IPI/UPI), operators, MachineSets, custom SCCs, built-in monitoring | OpenShift Installer, oc CLI, operators (Ceph via ODF/OCS), GitOps (ArgoCD?) | [Repo →](https://github.com/yourusername/openshift-deployment-blueprint) |
##| **GitOps / ArgoCD on Kubernetes/OpenShift** | (optional but very strong) GitOps-managed apps & infra | ArgoCD, Helm, Kustomize | Add if you have it |

## 🔥 Highlights from Real Work

- Designed Ceph CRUSH map for SSD vs HDD tiering → achieved < 200ms p99 latency on RBD
- Troubleshooted & fixed Ceph OSD flapping under high load (tuned bluestore, rocksdb)
- Migrated workloads from old storage → Ceph RBD with zero downtime using volume snapshots
- Hardened OpenShift: network policies, pod security, RBAC least privilege
- Set up HA control plane + etcd backup strategy on Kubernetes

## 🧰 Tech Stack I Operate Daily

**Orchestration:** Kubernetes, OpenShift  
**Storage:** Ceph (Rook/ODF), Longhorn, NFS  
**CI/CD & GitOps:** GitHub Actions, ArgoCD, Tekton (if used)  
**IaC:** Terraform / OpenTofu, Ansible  
**Observability:** Prometheus, Grafana, Loki, Alertmanager  
**Networking:** Cilium, Calico, Multus  
**Others:** Helm 3, Kustomize, cert-manager, Velero

## 📊 Let's Connect

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Zaki-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/zaki-zahid-a108087a/)  
[![Email](https://img.shields.io/badge/Email-📧-orange?style=flat)](mailto:zaki_zahid@hotmail.com)

<p align="center">
  <i> • Last updated Feb 2026</i>
</p>
