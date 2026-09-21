# PickleAI Zig Core

This directory contains the incremental Zig rewrite of PickleAI's runtime core.

## Current stage

The first stage is intentionally small and dependency-free:

- deterministic command loop
- status output
- starter observe/plan/execute/verify/recover lifecycle
- a stable place to add native process, filesystem, and checkpoint modules

## Build

Install Zig 0.13+ and run:

```bash
zig build
zig build run
```

Then enter one of:

```text
status
plan
help
quit
```

## Planned modules

1. `runtime` — lifecycle and cancellation
2. `planner` — model-facing task plans
3. `tools` — allowlisted OS operations
4. `verify` — post-action checks
5. `recovery` — checkpoint and retry state
6. `memory` — SQLite or a small append-only journal adapter
7. `bridge` — compatibility with the existing Python GUI and model servers
8. `packaging` — native Windows build and later portable targets

The Zig core is not yet a complete desktop replacement. It is a safe bootstrap branch intended to be compiled and expanded in small, testable stages.
