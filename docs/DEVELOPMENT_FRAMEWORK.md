# Development Framework

## Purpose

This document is the core operating manual for a repo using the Agentic Planning Framework Kit.

It defines:

- how work moves from idea to implementation
- how milestones should be framed and closed
- how improvement suggestions should be surfaced
- how donor patterns and `AGENTS.md` stay subordinate to the planning trunk

## Core Decision

Do not let the framework become a second architecture.

The planning trunk for any project remains:

- the project-specific architecture docs
- the roadmap
- the backlog
- the stack and boundary docs

This framework tells the repo how to operate work, not what product to build.

## Canonical Flow

Every meaningful body of work should move through:

1. `Frame`
2. `Lock`
3. `Slice`
4. `Build`
5. `Verify`
6. `Close`

## Stage Meanings

### Frame

Before coding:

- clarify the goal
- map it to the current milestone or ticket
- identify source-of-truth docs
- identify the main risk being reduced
- answer the pre-phase questions when entering a new milestone or ticket cluster

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
- surface recurring failures or missing contracts as bounded improvement proposals when they are too important to ignore but not yet approved for implementation

### Close

Before saying work is complete:

- update truth docs
- record decisions and unresolveds
- verify alignment between code, docs, and agent instructions
- run the smallest useful verification set
- record explicit verification notes
- batch low-priority improvement proposals into explicit next steps
- leave a clear next step
- write a short handoff summary
- review repo state
- make one clean commit
- commit intentionally
- push intentionally

Minimum deliverables before saying "phase complete":

- updated docs
- explicit unresolveds
- verification notes
- clear next step

## Pre-Phase Questions

Before a new milestone or significant ticket cluster begins, answer:

1. What is this phase proving?
2. What docs are the source of truth for it?
3. What hidden failure modes are most likely in this phase?
4. What tests must pass before we call it complete?
5. What docs or contracts may need updating during the phase?
6. Are any donor ideas being introduced, and if so, did they pass triage?
7. Are any ticket write scopes too narrow for the planned work?
8. Which decisions in this phase are gated and must come back to the user instead of being assumed?
9. Which stage matters most in this phase: `Frame`, `Lock`, `Slice`, `Build`, `Verify`, or `Close`?

A good pre-phase outcome should leave behind:

- a phase goal restatement
- expected risky edges
- minimum tests
- likely doc touchpoints
- explicit no-touch areas
- explicit gated decisions, if any

## Milestone Emphasis

Use the roadmap to know what is being built.

Use these patterns to know how to operate the work:

- stabilization work: emphasize `Frame` and `Lock`
- domain work: emphasize `Lock` and `Build`
- runtime or spine work: emphasize `Slice` and `Verify`
- policy or governance work: emphasize `Lock` and `Verify`
- interface or surface work: emphasize `Build` and `Close`

## Improvement Proposal Rule

Agents may detect many possible improvements during work.

Cap interruptions, not detection.

When multiple candidate proposals exist, rank them by:

1. impact if left unresolved
2. urgency
3. confidence that the issue is real
4. reversibility

Prefer surfacing proposals that are:

- high impact
- likely to recur
- hard to reverse later
- well supported by evidence from the work

Default handling:

- low-priority improvements: batch for `Close`
- medium-priority improvements: surface at the next natural checkpoint, usually `Verify` or `Close`
- high-priority improvements: surface promptly
- critical or gated improvements: escalate immediately and do not count against the normal proposal budget

An improvement proposal should include:

- short title
- why it matters
- evidence from the work
- proposed next step
- whether it is advisory or gated

If a deferred issue keeps recurring, its priority should rise.

## Donor Adoption Rule

Do not migrate wholesale into an external framework just because it sounds cleaner.

If an external pattern is introduced, ask:

1. What problem is it solving?
2. Is it consistent with the repo's architecture and boundaries?
3. Does it import hidden scope or maintenance burden?
4. Does it change policy, autonomy, privacy, or trust posture?
5. Is it being adopted as a pattern, a direct implementation, or just reference context?
6. Which project docs must be updated if it is adopted?

Donor material is context until it is explicitly triaged and adopted.

## AGENTS Alignment Rule

`AGENTS.md` must stay derived from the planning trunk instead of becoming a second hidden architecture.

If `AGENTS.md` changes meaningfully, update the relevant planning docs too.

If the planning docs change meaningfully, update `AGENTS.md` if the change affects agent behavior.

If `AGENTS.md` and the planning trunk disagree, the planning trunk wins and the mismatch should be fixed explicitly.

## Working Rule

Adopt workflow patterns.

Do not outsource architectural authority.
