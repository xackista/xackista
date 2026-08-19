# 🔄 Container CI/CD Pipeline

## Objective
Demonstrate a safe source-to-deployment pipeline.

## Pipeline

```text
Commit → Test → Build → Scan → Registry → Deploy → Smoke Test → Promote/Rollback
```

## Build and Test

```bash
docker build -t portfolio-demo:1.0 .
docker run --rm -p 8080:80 portfolio-demo:1.0
curl http://localhost:8080
```

Podman:

```bash
podman build -t portfolio-demo:1.0 .
podman run --rm -p 8080:80 portfolio-demo:1.0
```

## Kubernetes

```bash
kubectl create namespace portfolio-demo
kubectl apply -f ../kubernetes-ha-lab/manifests/sample-workload.yaml
kubectl rollout status deployment/web -n portfolio-demo
```

## Production Controls

- Immutable image tags
- Vulnerability scanning
- Secret management
- Protected branches
- Approval gates
- Health checks
- Rollback
- Audit trail

A mature pipeline must be able to detect a bad release and recover safely.
