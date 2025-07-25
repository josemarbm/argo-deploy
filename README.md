### Medium

[Deploy infra stack using self-managed ArgoCD with Cert Manager, ExternalDNS, External Secrets Op, Ingress-Nginx, Keycloak and RabbitMQ (8/17)](https://medium.com/@jojoooo/deploy-infra-stack-using-self-managed-argocd-with-cert-manager-externaldns-external-secrets-op-640fe8c1587b)

# ArgoCD infra & observability labs

### Dependencies

* [kubectl](https://kubernetes.io/docs/tasks/tools)
* [helm](https://helm.sh/docs/intro/install)
* [kustomize](https://kubectl.docs.kubernetes.io/installation/kustomize)
* [argocd](https://argo-cd.readthedocs.io/en/stable/cli_installation)
* [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
* [envsubst](https://www.baeldung.com/linux/envsubst-command) (should already be present in your linux system)

### Getting Started

Create local cluster with [Kind](https://kind.sigs.k8s.io/), [ingress-nginx](https://kubernetes.github.io/ingress-nginx) and [argocd](https://argo-cd.readthedocs.io/en/stable):

```bash
make start-kind
```

Remove & delete Kind cluster:

```bash
make delete-kind
```

### ArgoCD

* [http://argo-local.cloud-diplomats.com](http://argo-local.cloud-diplomats.com/) - login: admin, password: see `make start-kind` logs

### Apps-of-Apps

[This pattern](https://argo-cd.readthedocs.io/en/stable/operator-manual/cluster-bootstrapping/#app-of-apps-pattern) allow to declaratively specify one Argo CD app that consists only of other apps.

| Applications  | Urls |
| ------------- | ------------- |
| Infra | <https://github.com/Jojoooo1/argo-deploy-applications-infra> |
| Observability | <https://github.com/Jojoooo1/argo-deploy-applications-observability> |
| Data  | <https://github.com/Jojoooo1/argo-deploy-applications-data>  |
| Experimental (do not recommend to self manage)  | <https://github.com/Jojoooo1/argo-deploy-applications-experimental>  |
| Cloud diplomats Applications | <https://github.com/Jojoooo1/argo-deploy-applications> |

## Limitations

Wifi router can block some ports and leave Kind without stable communication. If you encounter issues, consider trying a different network or checking local firewall settings.
