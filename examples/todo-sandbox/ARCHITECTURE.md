# Architecture

## Canonical Architecture Summary

The sandbox is a small in-memory library with one main state owner, `TaskBoard`, and one domain entity, `Task`.

The architectural bet is that a tiny but explicit domain/application split is enough to test the framework without adding infrastructure noise.

The main risk this architecture controls is hidden complexity from adding storage, automation, or interface concerns too early.

## Module Or Directory Map

- `src/task_board.py`
  purpose: owns the `Task` entity, `TaskBoard` state container, and simple projections
  may depend on: Python standard library
  must not depend on: external services, file I/O, environment configuration
- `tests/test_task_board.py`
  purpose: verifies deterministic behavior and ticket acceptance criteria
  may depend on: `src/task_board.py`, Python standard library
  must not depend on: network calls, sleep-based timing, external state

## Layer Boundaries

- domain layer rules: `Task` instances stay simple and deterministic
- application layer rules: `TaskBoard` owns mutation and query orchestration
- infrastructure layer rules: there is no infrastructure layer yet
- interface layer rules: future interfaces must call into `TaskBoard` instead of reimplementing behavior

## Runtime Shell And Composition Root

- how the process starts: tests import the module directly
- where dependencies are wired: nowhere beyond module import because there are no external dependencies
- where configuration is read: nowhere because the sandbox is configuration-free
- where cross-cutting concerns live: not introduced yet

## State Ownership

- persistent state owner: none
- transient runtime state owner: `TaskBoard`
- concurrency or ordering constraints: task ids must grow monotonically and listing must remain deterministic
- error and retry model: invalid input raises explicit exceptions and callers decide how to handle them

## Integration Boundaries

- external APIs or providers: none
- storage boundaries: snapshot output may be consumed later, but persistence is out of scope
- messaging or event boundaries: none
- serialization or contract boundaries: `snapshot()` returns a stable list of dictionaries for future callers

## Testing Seams

- pure units that should stay easy to test: title normalization, filtering, summary counts, snapshot projection
- fakes or stubs that should exist: none yet
- smoke or startup paths that need coverage: module import and standard task flow

## Change Control

- changes that may be handled as normal implementation detail: method decomposition, helper naming, test case structure
- changes that require explicit architecture approval: persistence, autonomous behavior, external interfaces, background execution

## Working Rule

Keep this architecture small, explicit, and easy to reason about.
