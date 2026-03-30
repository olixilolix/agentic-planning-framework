# Development Framework

## Purpose

This document defines the workflow framework for the repo.

It answers:

- how work moves from idea to implementation
- how external workflow donors should be adopted
- which practices are canonical for the repo

## Core Decision

The repo should not migrate wholesale into an external framework.

The correct move is:

- keep the repo's planning trunk as the canonical architecture source
- adopt selected workflow patterns from external frameworks only when they fit
- integrate those patterns into the repo's own rules, checkpoints, and delivery flow

## Canonical Repo Framework

The repo framework is:

- `Frame`
- `Lock`
- `Slice`
- `Build`
- `Verify`
- `Close`

## Stage Meanings

### Frame

Before coding:

- clarify the goal
- map it to the current milestone or ticket
- identify source-of-truth docs
- run pre-phase Q&A when entering a new phase or ticket cluster

### Lock

Before implementation broadens:

- lock architecture references
- lock write scope
- identify risky edges
- identify tests and docs that will be touched
- identify likely gated user decisions before coding pressure encourages assumptions

### Slice

Convert work into:

- bounded tickets
- explicit write scopes
- clear acceptance criteria
- explicit no-touch areas

### Build

Implement small, bounded changes:

- follow ticket scope
- keep project architecture visible
- do not invent architecture while coding

### Verify

Before completion:

- run required tests
- check doc alignment
- check operational constraints
- review quality and safety

### Close

Before saying work is complete:

- apply the phase-close checklist
- record unresolveds
- write a handoff summary
- commit intentionally
- push intentionally

## Ownership Rule

The repo's planning trunk remains canonical.

If an external framework suggests a conflicting rule:

1. the current planning trunk wins
2. the donor idea must pass donor triage
3. the repo may adopt the idea only by updating canonical docs

## Working Rule

Adopt workflow patterns.

Do not outsource architectural authority.