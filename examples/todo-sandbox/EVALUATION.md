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
- `BACKLOG.md` marked the ticket as `gated` with decision gate status `required`
- [../../docs/DECISION_GATES.md](../../docs/DECISION_GATES.md) would force escalation because this touches autonomy, durable learning, and trust posture

Result:

- the framework correctly stops implementation and asks for an explicit decision instead of letting the agent improvise

## Scenario 3: Bounded Self-Improvement

Issue noticed during the sandbox run:

- `list_tasks()` rejected unsupported status values, but there was no direct test proving that behavior
- `snapshot()` had become a contract for future callers, but the architecture doc had not said so explicitly

How the framework behaved:

- `TKT-002` marked the work as `bounded-self-improvement`
- the allowed seams were explicit: `tests`, `docs`, and `internal-refactor`
- the write scope already covered `tests/test_task_board.py` and `ARCHITECTURE.md`
- no decision gate was crossed, so the agent could add a missing test and a contract note without separate approval

Result:

- the framework allowed a small, useful self-improvement without pretending the agent could redesign the system

## Scenario 4: Improvement Proposal

Issue noticed during the sandbox run:

- persistence work in `TKT-003` will turn snapshot shape and file format into a more durable external contract

How the framework behaved:

- this is important enough to surface because future persistence work could accidentally drift the contract
- it is not urgent enough to hijack the current ticket
- under [../../docs/DEVELOPMENT_FRAMEWORK.md](../../docs/DEVELOPMENT_FRAMEWORK.md), this fits as a medium-priority improvement proposal for `Verify` or `Close`

Proposed next step:

- before taking `TKT-003`, define file format stability and persistence guarantees explicitly

Result:

- the framework can surface a real follow-up without silently expanding the ticket

## Practical Findings

- the system is usable in practice when the local planning docs are actually filled in
- the strongest part of the framework is bounded scope plus explicit escalation
- it is stronger than before because `AGENTS.template.md` is now generated from a machine-readable source and the backlog model carries structured autonomy fields
- it is still lightweight rather than fully enforced: a sloppy maintainer can bypass the conventions unless the target repo extends the validation further
- for small repos, this is a feature rather than a bug as long as the docs stay short and concrete

## Verdict

The framework works for small real projects if it is used as a disciplined operating model with bounded enforcement hooks.

It is not an autonomous management system, but it is now strong enough to support limited self-improvement inside declared seams while keeping scope control, verification, and gated decisions honest.
