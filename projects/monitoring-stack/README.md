# 📊 Prometheus + Grafana Infrastructure Monitoring

## Objective
Build an actionable infrastructure monitoring stack.

## Architecture
```text
Linux → node_exporter → Prometheus → Grafana → Alerting/Runbook
```

## Validation

```bash
systemctl status prometheus
promtool check config prometheus.yml
promtool check rules alerts.yml
curl http://<node>:9100/metrics | head
```

## Useful PromQL

```promql
up
node_cpu_seconds_total
node_memory_MemAvailable_bytes
node_filesystem_avail_bytes
node_network_receive_bytes_total
```

## Dashboard Areas

- CPU
- Load
- Memory
- Filesystem
- Disk I/O
- Network
- Host availability

Every alert should identify the condition, severity, impact and runbook. Avoid alert noise that produces no actionable response.
