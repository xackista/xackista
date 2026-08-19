# Enterprise Infrastructure Architecture

This reference architecture shows how the portfolio domains fit together in a realistic enterprise environment.

```mermaid
flowchart TB
    U[Users / Applications] --> WAF[WAF / Reverse Proxy]
    WAF --> LB[HAProxy / Keepalived VIP]
    LB --> K8S[Kubernetes / OpenShift Cluster]
    K8S --> CSI[CSI Storage Layer]
    CSI --> CE[Ceph Cluster]

    K8S --> MON[Prometheus / Grafana]
    MON --> ALERT[Alertmanager / Runbooks]

    ADM[Administrator] --> V[VMware vCenter]
    V --> ESX[ESXi Cluster]
    ESX --> SAN[SAN / LUNs]
    SAN --> ESX

    AUTO[Terraform] --> V
    AUTO --> ANS[Ansible]
    ANS --> LNX[RHEL / Linux Hosts]
    ANS --> SEC[SELinux / auditd / AIDE / firewalld]
    LNX --> MON

    DNS[Enterprise DNS] --> LB
    DNS --> K8S
```

## Engineering concerns demonstrated

- Separation of compute, network, storage and observability concerns.
- VMware provides the virtualization foundation for Linux and container platforms.
- HAProxy/Keepalived provides a stable API/application entry point.
- Ceph provides distributed storage consumed through CSI.
- Terraform handles repeatable infrastructure provisioning while Ansible handles host configuration.
- SELinux, auditd, AIDE and firewalld form the host-security layer.
- Prometheus/Grafana closes the operational loop with metrics, alerting and runbooks.

> Portfolio material is a public reference architecture. It intentionally contains no employer topology, credentials, customer information or proprietary configuration.
