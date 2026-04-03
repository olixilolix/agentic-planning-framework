# Evaluation

This document records a practical pressure test of the framework against the Todo Sandbox example project.

## Scenario 1: Normal Bounded Ticket

Ticket used:

- `TKT-002: Add deterministic summary and snapshot projections`

How the framework behaved:

- `Frame`: the source of truth was clear because the ticket, architecture, and roadmap all pointed at deterministic projections for future callers
- `Lock`: the write scope stayed narrow: `src/task_board.py` and `tests/test_task_board.py`
- `Slice`: acceptance criteria were concrete enough to turn directly into tests
- `Build`: implementation stayed inside the in-memory core without leaking in persistence or interface code
- `Verify`: `python -m unittest discover -s .\tests -p "test_*.py" -v` passed
- `Close`: the remaining follow-up was small and explicit rather than hidden in the implementation

Result:

- the framework worked well for a small, bounded ticket

## Scenario 2: Gated Request

Request used:

- implement `TKT-004: Auto-prioritize tasks from user behavior`

How the framework behaved:

- `SYSTEM_BOUNDARIES.md` marked behavioral learning as out of scope
- `BACKLOG.md` marked the ticket as not approved
- [../../docs/DECISION_GATES.md](../../docs/DECISION_GATES.md) would force escalation because this touches autonomy, durable learning, and trust posture

Result:

- the framework correctly stops implementation and asks for an explicit decision instead of letting the agent improvise

## Scenario 3: Improvement Proposal

Issue noticed during the sandbox run:

- `snapshot()` now acts like a contract for future callers, but the project has no dedicated contract or persistence-shape doc yet

How the framework behaved:

- this is important enough to surface because future persistence or interface work could accidentally drift the shape
- it is not urgent enough to hijack the current ticket
- under [../../docs/DEVELOPMENT_FRAMEWORK.md](../../docs/DEVELOPMENT_FRAMEWORK.md), this fits as a medium-priority improvement proposal for `Verify` or `Close`

Proposed next step:

- before taking `TKT-003`, add an explicit contract section to `ARCHITECTURE.md` or a small `CONTRACTS.md`

Result:

- the framework can surface a real follow-up without silently expanding the ticket

## Practical Findings

- the system is usable in practice when the local planning docs are actually filled in
- the strongest part of the framework is bounded scope plus explicit escalation
- the weakest part is that it is still manual: a sloppy maintainer can ignore the docs and the framework will not stop them by itself
- for small repos, this is a feature rather than a bug as long as the docs stay short and concrete

## Verdict

The framework works for small real projects if it is used as a disciplined operating model.

It is not an autonomous management system, but it is strong enough to keep a human-agent project honest, especially around scope control, verification, and gated decisions.
