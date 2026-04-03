# aks-tools

Interactive CLI tools for managing Azure Kubernetes Service (AKS) clusters from your terminal.

No more remembering long `kubectl` commands, switching contexts manually, or copy-pasting namespace names. Just run the tool, pick from fuzzy-searchable menus, and get things done.

## Tools

### [`aksc`](./aksc/) - AKS Console

Instantly open a **Rails console** (or any shell) inside a running AKS pod. Handles subscription switching, credential fetching, image detection, configmap injection, and pod cleanup automatically.

### [`aksm`](./aksm/) - AKS Manager

Interactive dashboard for **pod status, logs, configmaps, and deployments**. View and edit configmap values, tail logs, restart deployments - all through a single command.

## Quick Install

```bash
# Clone
git clone https://github.com/zaidhassan168/aks-tools.git

# Copy to your PATH
cp aks-tools/aksc/aksc ~/bin/
cp aks-tools/aksm/aksm ~/bin/
chmod +x ~/bin/aksc ~/bin/aksm
```

## Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) (`az`) - logged in with `az login`
- [kubectl](https://kubernetes.io/docs/tasks/tools/) - Kubernetes CLI
- [fzf](https://github.com/junegunn/fzf) (optional, recommended) - fuzzy finder for interactive menus
- `python3` - required by `aksc` for JSON parsing

## Why?

Working with multiple AKS clusters across dev, staging, and production subscriptions means constantly running:

```bash
az account set --subscription "..."
az aks get-credentials --resource-group "..." --name "..."
kubectl config use-context "..."
kubectl -n some-long-namespace-name get pods
kubectl -n some-long-namespace-name logs pod-name-hash-xyz
```

These tools replace all of that with interactive menus. Each tool manages its own kube context so dev/stg/prod never overwrite each other.

## License

MIT
