# Kubernetes HA Platform — Architecture & Evidence

## Architecture

```mermaid
flowchart TB
    VIP[API VIP / Load Balancer]
    VIP --> CP1[Control Plane 1]
    VIP --> CP2[Control Plane 2]
    VIP --> CP3[Control Plane 3]

    CP1 --> ETCD[(etcd)]
    CP2 --> ETCD
    CP3 --> ETCD

    CP1 --> W1[Worker 1]
    CP2 --> W2[Worker 2]
    CP3 --> W3[Worker 3]

    W1 --> SVC[Service / Ingress]
    W2 --> SVC
    W3 --> SVC
    SVC --> APP[Replicated Application]

    W1 --> CSI[CSI]
    W2 --> CSI
    W3 --> CSI
    CSI --> CEPH[(Ceph RBD / Storage)]

    APP --> PROM[Prometheus]
    PROM --> GRAF[Grafana]
```

## What this demonstrates

- HA control-plane design with a stable API endpoint.
- etcd quorum awareness and control-plane dependency analysis.
- Replicated workloads with readiness/liveness probes.
- Resource requests and limits to improve scheduling predictability.
- Service-based workload exposure.
- CSI-backed persistent storage.
- Monitoring and operational troubleshooting.

## Troubleshooting scenarios

### API server unreachable

1. Validate DNS and the API VIP.
2. Test TCP connectivity to the API port.
3. Check load-balancer health and backend state.
4. Inspect control-plane kubelet and API-server logs.
5. Validate certificates and SANs.
6. Confirm etcd health and quorum.

### Pod stuck in Pending

```bash
kubectl describe pod <pod> -n <namespace>
kubectl get events -n <namespace> --sort-by=.lastTimestamp
kubectl get nodes --show-labels
kubectl get pvc -n <namespace>
```

Focus on scheduler events, resource pressure, node selectors/taints and PVC binding rather than restarting components blindly.

### Application is Running but not Ready

```bash
kubectl describe pod <pod> -n <namespace>
kubectl logs <pod> -n <namespace>
kubectl get endpoints <service> -n <namespace>
```

Validate the probe path, application listener, service selector and endpoint population.

## Evidence policy

Examples are lab/reference material. No production screenshots, credentials, client identifiers or fabricated incident metrics are included.
