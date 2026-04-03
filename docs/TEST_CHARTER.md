# Test Charter

## Purpose

This document defines the minimum quality bar for a repo using the Agentic Planning Framework Kit.

## Core Rule

"Run the relevant checks" is not enough by itself.

The repo should use explicit test expectations by layer.

## Planning And Coherence Checks

Required when planning docs, `AGENTS.md`, or stack rules change:

- docs and links resolve where practical
- roadmap, backlog, and contracts do not contradict each other on the changed topic
- if `AGENTS.md` changed, it still matches the planning trunk

## Domain Layer Checks

Required expectations:

- imports cleanly
- models construct cleanly
- pure transition rules behave deterministically
- no infrastructure leakage into domain objects unless the architecture explicitly allows it

## Application Layer Checks

Required expectations:

- deterministic fixtures
- bounded inputs and outputs
- fake time where timing behavior matters
- no sleep-based timing tests where fake time can be used

## Infrastructure Layer Checks

Required expectations:

- startup configuration path tested
- provider or external boundary tested with fakes or stubs where practical
- degraded-mode behavior tested structurally, not only by manual observation

## Interface Layer Checks

Required expectations:

- smoke tests
- config or startup guidance behavior
- boundary checks when new interfaces are introduced

## Working Rule

Use explicit minimums.

Do not let testing degrade into vibes.
