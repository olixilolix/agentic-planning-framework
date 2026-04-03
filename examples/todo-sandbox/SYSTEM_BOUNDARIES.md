# System Boundaries

## System Identity

- what the system is: a tiny in-memory task board
- who it serves: a single local user or a test harness
- which operators or maintainers it assumes: a developer running local tests

## In-Scope Responsibilities

- create tasks with normalized titles
- mark tasks complete
- list tasks by status
- expose deterministic summaries and snapshots for downstream callers

## Explicit Non-Goals

- multi-user collaboration
- durable storage
- background automation
- behavioral learning from user actions

## Boundary Map

- upstream systems or inputs: direct library calls from tests or a future CLI
- downstream systems or outputs: Python objects and simple snapshot dictionaries
- internal subsystems or seams: domain state, summary projection, and snapshot projection
- external services or providers: none

## Trust, Privacy, And Safety Boundaries

- sensitive data categories: none in the intended sandbox use
- retention or logging constraints: no hidden persistence
- permission or autonomy constraints: the system must not infer or execute actions without explicit calls
- trust assumptions that must stay explicit: callers own persistence and any future integration behavior

## Must-Not-Infer Rules

- do not silently persist tasks
- do not learn from user behavior
- do not create or reorder tasks automatically

## Working Rule

Keep scope explicit and local.
