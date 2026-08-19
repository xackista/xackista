# Monitoring Evidence

The portfolio should show monitoring as an operational system, not merely a list of tools.

## Recommended dashboard panels

- Host availability / up status
- CPU utilization and load
- Memory pressure
- Filesystem utilization
- Disk I/O latency
- Network throughput/errors
- Kubernetes pod availability
- Kubernetes node readiness
- Alert state and alert history

## Prometheus validation

```bash
curl -s http://<prometheus>:9090/-/healthy
curl -s http://<prometheus>:9090/api/v1/query --data-urlencode 'query=up'
```

## Grafana evidence capture

When a real lab environment is available, capture screenshots showing:

1. Infrastructure overview dashboard.
2. Host resource panel.
3. Kubernetes health panel.
4. Alert firing and recovery.
5. Drill-down from alert to metric.

Do not create simulated screenshots and present them as production evidence. Screenshots should be clearly labelled **Lab / Demonstration** and should contain no credentials, internal hostnames or sensitive information.

## Operational principle

Every alert should answer three questions:

- What is wrong?
- What is the likely impact?
- What should the operator check next?
