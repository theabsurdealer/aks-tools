# aksm — DEPRECATED

> **`aksm` is now a thin shim that forwards to [`kit`](../kit/).**
> New users should install and use `kit` directly. This wrapper only exists so existing muscle memory keeps working.

| Old command | New equivalent |
| --- | --- |
| `aksm` | `kit` |
| `aksm pods` | `kit pods` |
| `aksm logs` | `kit logs` |
| `aksm logs-follow` | `kit logs-f` |
| `aksm cm-view` / `cm-get` / `cm-set` / `cm-del` | `kit cm-view` / `cm-get` / `cm-set` / `cm-del` |
| `aksm restart` | `kit restart` |

See [`../kit/README.md`](../kit/README.md) for the full documentation.

## What it used to do

`aksm` was an interactive dashboard for pods, logs, configmaps, and deployments in AKS — fuzzy pickers for subscription/cluster/namespace, then an action menu to inspect or mutate resources. All of it now lives in `kit`, plus back-navigation between menus, paged output you can scroll/select, and an `exec` action for shelling into running pods.
