# aksc - AKS Console

Interactive CLI tool to open a **Rails console** (or any interactive shell) inside an Azure Kubernetes Service (AKS) pod. One command replaces the entire workflow of switching Azure subscriptions, fetching cluster credentials, finding the right namespace, detecting the container image, and spinning up a console pod.

## Features

- Interactive fuzzy-searchable pickers for subscription, cluster, and namespace
- Automatically detects the container image and configmap from existing deployments
- Copies node scheduling (nodeSelector, tolerations, affinity) from running pods
- Automatic pod cleanup on exit (no orphaned console pods)
- Orphaned pod detection and bulk cleanup
- Isolated kube contexts per subscription+cluster (dev/stg/prod never conflict)
- Works with or without `fzf` (falls back to numbered menus)
- Supports both `attach` and `exec` modes

## Installation

```bash
curl -o ~/bin/aksc https://raw.githubusercontent.com/zaidhassan168/aks-tools/main/aksc/aksc
chmod +x ~/bin/aksc
```

Or clone the repo:

```bash
git clone https://github.com/zaidhassan168/aks-tools.git
cp aks-tools/aksc/aksc ~/bin/
chmod +x ~/bin/aksc
```

Make sure `~/bin` is in your `PATH`.

## Prerequisites

- `az` (Azure CLI) - authenticated via `az login`
- `kubectl`
- `python3`
- `fzf` (optional, recommended for fuzzy search menus)

## Usage

```bash
# Interactive mode - pick subscription, cluster, namespace, connect to console
aksc

# Use exec mode (starts a new console process instead of attaching)
aksc --exec

# List orphaned console pods across all clusters
aksc --list

# Clean up all orphaned pods
aksc --cleanup-all

# Keep pod alive on failure (for debugging)
KEEP_POD=1 aksc
```

## How It Works

1. Lists your Azure subscriptions and lets you pick one
2. Lists AKS clusters in that subscription
3. Fetches cluster credentials into an isolated kube context
4. Lists namespaces and lets you pick one
5. Detects the container image from existing deployments
6. Finds a running pod to copy scheduling constraints from
7. Creates a new pod running `rails console` with the correct image and configmap
8. Attaches to the pod's TTY
9. Deletes the pod on exit

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `KEEP_POD` | `0` | Set to `1` to keep pod on failure |
| `AKSC_ATTACH_MODE` | `attach` | Set to `exec` to use exec mode |

## Keywords

azure kubernetes service, aks rails console, kubectl interactive, aks pod shell, azure aks cli tool, kubernetes rails console, aks cluster management, kubectl namespace picker, azure aks devtools, kubernetes developer tools
