# 📊 Monitoring & Alerting Runbooks

## Objective
Turn infrastructure metrics into **actionable operational signals** using Prometheus, Grafana and alerting/runbook practices.

## Monitoring Flow

```text
Linux / Kubernetes
       ↓
 Exporters / Metrics
       ↓
 Prometheus
       ↓
 Alert Rules
       ↓
 Grafana / Alerting
       ↓
 Runbook / Investigation
```

## Core Signals

### Availability

```promql
up
```

### CPU

Monitor sustained utilization rather than short spikes. Correlate CPU with load, process state and application behavior.

### Memory

```promql
node_memory_MemAvailable_bytes
```

Investigate reclaim pressure, swap activity and workload behavior before concluding that high cache usage is a problem.

### Filesystem

```promql
node_filesystem_avail_bytes
```

Alert on meaningful capacity thresholds and exclude pseudo-filesystems where appropriate.

## Example Incident Runbook

### Linux Server High Load

```text
Alert
 ↓
Confirm host availability
 ↓
Check load / CPU / I/O
 ↓
Identify D-state or runaway processes
 ↓
Check disk and filesystem
 ↓
Correlate system logs
 ↓
Validate application impact
 ↓
Remediate
 ↓
Document root cause
```

Useful commands:

```bash
uptime
top
ps -eo state,pid,ppid,cmd --sort=state
iostat -xz 1 5
vmstat 1 5
dmesg -T | tail -100
journalctl -p warning..alert -b
```

## Alert Quality Principles

Every alert should communicate:

- Condition
- Severity
- Likely impact
- Relevant host/service
- Immediate diagnostic steps
- Link to a runbook

Avoid alert rules that generate noise without an actionable response.

## Skills Demonstrated

**Prometheus | Grafana | Alerting | Linux Monitoring | PromQL | Incident Response | Runbooks | Observability**

## Business Value

Actionable monitoring helps teams detect failures earlier, shorten investigation time and create consistent operational responses instead of relying on manual discovery.
