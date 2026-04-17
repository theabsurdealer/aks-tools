# kit — Kubernetes Interactive Toolkit

The unified successor to `aksc` and `aksm`. One CLI, one menu, one mental model.

```
kit
```

…drops you into a fuzzy-searchable picker for **subscription → cluster → namespace → action**, then loops you back to the action menu so you can keep working without restarting.

## Why

`aksc` and `aksm` shared the same picker flow but lived as two scripts. `kit` collapses them into one binary, adds proper back-navigation between menus, pages long output through `less` so you can scroll/select/copy, and adds an `exec` action for shelling into running pods.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/zaidhassan168/aks-tools/main/install.sh | bash
```

Or manually:

```bash
git clone https://github.com/zaidhassan168/aks-tools.git
cp aks-tools/kit/kit ~/bin/kit
chmod +x ~/bin/kit
```

## Prerequisites

- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) (`az`) — logged in via `az login`
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [fzf](https://github.com/junegunn/fzf) (recommended) — fuzzy finder for the menus
- `python3` (for parsing pod JSON in the `console` action)
- `less` (almost always already installed)

## Usage

### Interactive (default)

```bash
kit
```

Pick subscription → cluster → namespace → action. After each action you stay in the action menu. Use `back-ns`, `back-cluster`, or `back-sub` to hop up a level. `quit` to exit.

### Direct subcommand

```bash
kit pods       # pick sub/cluster/ns then list pods
kit logs       # pick sub/cluster/ns/pod then tail logs
kit console    # spin up a Rails console pod
kit restart    # rollout restart a deployment
```

### Admin

```bash
kit cleanup           # delete all your orphaned Rails console pods across all clusters
kit list-orphaned     # list them without deleting
kit cleanup someone   # delete someone else's leaked pods
```

### Help

```bash
kit --help
```

## Actions

| Action | What it does |
| --- | --- |
| `pods` | List pods (paged) |
| `logs` | View logs of a picked pod (paged, tail 200) |
| `logs-f` | Follow logs live |
| `describe` | Describe a pod (paged) |
| `events` | Recent namespace events (paged) |
| `exec` | Open a shell in a running pod |
| `console` | Spin up a Rails console pod (mirrors `aksc`) |
| `cm-view` | Show a ConfigMap as full YAML |
| `cm-get` | Show ConfigMap data only |
| `cm-set` | Add/update ConfigMap values interactively |
| `cm-del` | Delete a ConfigMap key |
| `restart` | Rollout-restart a picked deployment |

## How `console` works

1. Detects the app's container image and ConfigMap from the namespace's deployments.
2. Copies scheduling (service account, node selector, tolerations, affinity) from a real Running pod so the console lands on the right node pool.
3. Creates a one-off `rails-console-<user>-<ts>` pod, attaches your terminal to it.
4. **Deletes the pod immediately when you exit** — no leaked pods after a clean exit.

If a pod fails to start, kit prints the pod debug (describe + events + container logs) automatically. Set `KEEP_POD=1 kit console` to keep failed pods for further inspection.

If `attach` doesn't show a Rails prompt (terminal compatibility quirk), use `KIT_ATTACH_MODE=exec kit console` — it sleeps the pod and `exec`s a fresh console process inside it.

## Kube contexts

`kit` creates uniquely-named contexts of the form `kit-<sub-prefix>-<cluster-name>` so dev/stg/prod credentials never overwrite each other. The orphan cleanup also recognises old `aksc-*` contexts for backward compatibility.

## Environment variables

| Var | Effect |
| --- | --- |
| `KEEP_POD=1` | Don't delete the Rails console pod if it failed to start (for debugging) |
| `KIT_ATTACH_MODE=exec` | Default the `console` action to exec mode instead of attach |
