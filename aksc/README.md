# aksc — DEPRECATED

> **`aksc` is now a thin shim that forwards to [`kit`](../kit/).**
> New users should install and use `kit` directly. This wrapper only exists so existing muscle memory keeps working.

| Old command | New equivalent |
| --- | --- |
| `aksc` | `kit console` |
| `aksc --exec` | `KIT_ATTACH_MODE=exec kit console` |
| `aksc --list` | `kit list-orphaned` |
| `aksc --cleanup-all` | `kit cleanup` |

See [`../kit/README.md`](../kit/README.md) for the full documentation.

## What it used to do

`aksc` was an interactive CLI that opened a Rails console (or any shell) inside an AKS pod — handling Azure subscription switching, credential fetching, image detection, configmap injection, and pod cleanup automatically. All of this is now part of `kit console`.
