# Kind Cluster Setup for Argo Deploy

This repository has been updated to use [Kind](https://kind.sigs.k8s.io/) instead of k3s for local Kubernetes cluster management.

## Prerequisites

Make sure you have the following tools installed:

- [Docker](https://docs.docker.com/get-docker/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm](https://helm.sh/docs/intro/install/)
- [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize/)
- [argocd CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/)
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

## Usage

### Start Kind cluster with ArgoCD
```bash
make start-kind
```

This will:
1. Create a Kind cluster named `argo-deploy` with 3 nodes (1 control-plane, 2 workers)
2. Install NGINX Ingress Controller for Kind
3. Install ArgoCD using Helm
4. Setup self-managed ArgoCD
5. Deploy ArgoCD applications for infrastructure and observability
6. Configure local DNS entries in `/etc/hosts`

### Delete Kind cluster
```bash
make delete-kind
```

This will completely remove the Kind cluster.

## Configuration

The Kind cluster configuration is defined in `kind-config.yaml` with:
- Port forwarding for HTTP (80) and HTTPS (443)
- Node labels for ingress-ready
- Multi-node setup for testing distributed workloads

## DNS Configuration

The script automatically adds entries to `/etc/hosts` for:
- ArgoCD UI: `http://argo-local.cloud-diplomats.com`
- Grafana: `http://grafana-local.cloud-diplomats.com`
- Prometheus: `http://prometheus-local.cloud-diplomats.com`
- AlertManager: `http://alertmanager-local.cloud-diplomats.com`
- And other observability tools

## Changes from k3s

- Replaced k3s installation with Kind cluster creation
- Updated NGINX Ingress installation to use Kind-specific manifests
- Modified DNS resolution to use `127.0.0.1` (localhost) instead of LoadBalancer IP
- Updated Makefile targets from `start-k3s`/`delete-k3s` to `start-kind`/`delete-kind`
