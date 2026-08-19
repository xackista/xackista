# Client-Facing Infrastructure Case Studies

These case studies are deliberately written as technical demonstrations, not claims about confidential production environments.

## 1. Linux Server Performance Investigation

**Client problem:** Linux server becomes slow even though CPU utilization appears low.

**Approach:**
- Check load average and runnable/uninterruptible tasks.
- Compare CPU idle, I/O wait and memory pressure.
- Inspect `ps`, `top`, `vmstat`, `iostat` and `dmesg`.
- Identify processes in `D` state and correlate them with storage/network dependencies.
- Review systemd and application logs.
- Remediate the underlying bottleneck and validate recovery.

**Deliverable:** Root-cause report, remediation plan and preventive monitoring recommendations.

## 2. Linux Security Hardening

**Client problem:** RHEL fleet requires a repeatable security baseline.

**Approach:** SELinux enforcement, SSH hardening, firewalld, auditd, AIDE, package/service baseline and Ansible automation.

**Deliverable:** Automated baseline plus validation checklist and exception documentation.

## 3. Kubernetes Production Troubleshooting

**Client problem:** Application is deployed but unavailable or unstable.

**Approach:** Inspect pod events, scheduling, probes, services/endpoints, resources, node health and storage dependencies before changing workloads.

**Deliverable:** Incident diagnosis, safe remediation and operational runbook.

## 4. OpenShift on VMware

**Client problem:** OpenShift UPI deployment fails during bootstrap or cluster bring-up.

**Approach:** Validate DNS, VIP/load-balancer health, RHCOS networking, Ignition retrieval, registry reachability and certificate SANs.

**Deliverable:** Deployment architecture, fault isolation checklist and validated cluster configuration.

## 5. VMware + SAN Troubleshooting

**Client problem:** VM performance or datastore availability degrades.

**Approach:** Separate compute, network and storage symptoms; inspect vCenter alarms, ESXi health, VMkernel paths, HBA visibility, LUNs and multipathing.

**Deliverable:** Fault-domain analysis, corrective action and validation plan.

## 6. Ceph CSI Storage Failure

**Client problem:** Kubernetes PVC provisioning fails.

**Approach:** Trace PVC → StorageClass → CSI controller → Ceph authentication → pool permissions → RBD operation. A representative `rados ret=-13` is investigated as an authorization failure rather than treated as a generic storage outage.

**Deliverable:** Root-cause analysis and repeatable storage troubleshooting procedure.

## 7. Backup Path Troubleshooting

**Client problem:** Backup job reports connectivity/direct-save or storage-node errors.

**Approach:** Distinguish control-plane communication from client/storage-node data paths; validate DNS, TCP reachability, firewall rules, service state and concurrent backup activity.

**Deliverable:** Connectivity matrix, evidence-based diagnosis and recovery procedure.

---

## What a client receives

- Clear problem statement
- Architecture or dependency map
- Safe investigation sequence
- Commands and configuration examples
- Root-cause reasoning
- Validation steps
- Runbook/documentation
- Automation where appropriate

> No client names, credentials, proprietary configurations, private IPs or fabricated production metrics are used in this public portfolio.
