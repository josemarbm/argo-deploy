SHELL := /bin/bash

help: ## Show this help message.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

start-kind: ## Start kind cluster with argocd
	@./scripts/start.sh

delete-kind: ## Delete kind cluster
	kind delete cluster --name argo-deploy || true
