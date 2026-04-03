# aksm - AKS Manager

Interactive CLI tool for managing **pods, logs, configmaps, and deployments** in Azure Kubernetes Service (AKS). A single command gives you a dashboard-like experience to inspect and manage your AKS workloads without memorizing long kubectl commands.

## Features

- Interactive fuzzy-searchable pickers for subscription, cluster, namespace, and resources
- View pod status, describe pods, check events
- Tail or follow pod logs across all containers
- View, edit, and delete configmap key-value pairs interactively
- Restart deployments with rollout status tracking
- Isolated kube contexts per subscription+cluster (dev/stg/prod never conflict)
- Interactive action loop - run multiple actions without re-authenticating
- Works with or without `fzf` (falls back to numbered menus)

## Installation

```bash
curl -o ~/bin/aksm https://raw.githubusercontent.com/zaidhassan168/aks-tools/main/aksm/aksm
chmod +x ~/bin/aksm
```

Or clone the repo:

```bash
git clone https://github.com/zaidhassan168/aks-tools.git
cp aks-tools/aksm/aksm ~/bin/
chmod +x ~/bin/aksm
```

Make sure `~/bin` is in your `PATH`.

## Prerequisites

- `az` (Azure CLI) - authenticated via `az login`
- `kubectl`
- `fzf` (optional, recommended for fuzzy search menus)

## Usage

```bash
# Interactive mode - pick subscription, cluster, namespace, then action menu
aksm

# Jump straight to a specific action
aksm pods          # List pods
aksm logs          # View pod logs
aksm logs-follow   # Follow pod logs live
aksm describe      # Describe a pod
aksm events        # Recent namespace events
aksm cm-view       # View configmap (full yaml)
aksm cm-get        # View configmap data (key/values only)
aksm cm-set        # Add or update configmap values
aksm cm-del        # Delete a configmap key
aksm restart       # Restart a deployment
```

## Actions

| Action | Description |
|---|---|
| `pods` | List all pods with status, restarts, node info |
| `logs` | Pick a pod and view last 100 log lines |
| `logs-follow` | Pick a pod and follow logs in real-time (Ctrl+C to stop) |
| `describe` | Full pod description including events and conditions |
| `events` | Last 30 namespace events sorted by time |
| `cm-view` | Full configmap YAML output |
| `cm-get` | Configmap data section only (key/value pairs) |
| `cm-set` | Interactively add or update configmap values (KEY=VALUE prompt) |
| `cm-del` | Pick a key to remove from a configmap |
| `restart` | Rollout restart a deployment and watch status |

## ConfigMap Management

Edit configmap values without writing YAML or JSON patches:

```
$ aksm cm-set
# picks subscription, cluster, namespace, configmap...

Set configmap values (KEY=VALUE). Empty line to finish.
  KEY=VALUE> DATABASE_URL=postgres://prod-db:5432/myapp
  KEY=VALUE> REDIS_URL=redis://prod-redis:6379
  KEY=VALUE>

Patching my-app-config with: {"DATABASE_URL":"postgres://prod-db:5432/myapp","REDIS_URL":"redis://prod-redis:6379"}
Confirm? (y/n) > y
configmap/my-app-config patched
Done. Run 'aksm restart' to apply changes.
```

## Keywords

azure kubernetes configmap editor, aks pod logs viewer, kubectl interactive tool, azure aks manager, kubernetes configmap management, aks deployment restart, kubectl pod status, azure kubernetes cli, aks devops tools, kubernetes developer productivity
