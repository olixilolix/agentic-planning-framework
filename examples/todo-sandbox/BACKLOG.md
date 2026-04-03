# Backlog

## TKT-001: Establish deterministic task board core

- goal: support task creation, completion, and filtered listing with explicit exceptions
- change class: implementation detail
- autonomy tier: `fixed-scope`
- allowed evolution seams: none
- expected write scope: `src/task_board.py`, `tests/test_task_board.py`
- no-touch areas: persistence, network, background work
- acceptance criteria:
  - creating a task normalizes surrounding whitespace
  - empty titles are rejected
  - completing a missing task raises an explicit error
  - filtered listing supports `all`, `open`, and `completed`
- related docs: `ARCHITECTURE.md`, `SYSTEM_BOUNDARIES.md`
- likely tests: task creation, completion, filter behavior, import smoke
- decision gate status: `none`
- gate owner, if any: none
- gated decisions, if any: none

## TKT-002: Add deterministic summary and snapshot projections

- goal: let future interfaces inspect board state without re-deriving counts or task shape
- change class: contract-facing implementation detail
- autonomy tier: `bounded-self-improvement`
- allowed evolution seams: `tests`, `docs`, `internal-refactor`
- expected write scope: `src/task_board.py`, `tests/test_task_board.py`, `ARCHITECTURE.md`
- no-touch areas: persistence, new interfaces, background automation
- acceptance criteria:
  - `summary()` returns counts for `all`, `open`, and `completed`
  - `snapshot()` returns a stable list of dictionaries in id order
  - projections do not mutate board state
- related docs: `ARCHITECTURE.md`, `ROADMAP.md`
- likely tests: summary counts, deterministic snapshot structure, invalid status handling, post-completion projections
- decision gate status: `none`
- gate owner, if any: none
- gated decisions, if any: none

## TKT-003: Add JSON persistence for explicit save and load operations

- goal: allow callers to persist board state without introducing hidden storage
- change class: contract change
- autonomy tier: `gated`
- allowed evolution seams: `none`
- expected write scope: `src/task_board.py`, `tests/test_task_board.py`, `ARCHITECTURE.md`
- no-touch areas: automation, telemetry, background sync
- acceptance criteria:
  - persistence is explicit and caller-driven
  - load behavior preserves task ids and completion state
  - storage paths are passed in, not inferred
- related docs: `ARCHITECTURE.md`, `SYSTEM_BOUNDARIES.md`, `ROADMAP.md`
- likely tests: round-trip save/load, malformed input handling
- decision gate status: `required`
- gate owner, if any: project maintainer
- gated decisions, if any: file format stability and persistence boundary wording

## TKT-004: Auto-prioritize tasks from user behavior

- goal: use past actions to infer future task priority
- change class: policy and autonomy change
- autonomy tier: `gated`
- allowed evolution seams: `none`
- expected write scope: not approved
- no-touch areas: everything until a gated decision is made
- acceptance criteria:
  - do not implement without explicit approval
- related docs: `SYSTEM_BOUNDARIES.md`, `../../docs/DECISION_GATES.md`, `../../docs/DEVELOPMENT_FRAMEWORK.md`
- likely tests: not applicable until approved
- decision gate status: `required`
- gate owner, if any: project maintainer
- gated decisions, if any: autonomy, durable learning, and trust posture
