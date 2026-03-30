# Phase Operating Playbook

## Purpose

This document explains how to apply the workflow framework to project milestones.

It does not replace the roadmap.

It explains:

- how a milestone should be operated
- which workflow stage matters most in that milestone
- what the pre-phase Q&A should focus on
- what verification emphasis should apply before close

## Canonical Flow For Every Milestone

Every milestone should run through:

1. Frame
2. Lock
3. Slice
4. Build
5. Verify
6. Close

## Generic Milestone Playbook

### Stabilization Phase

Main emphasis:

- Frame
- Lock

Focus on:

- repo coherence
- startup sanity
- stack lock
- guardrails before broader coding begins

### Domain Phase

Main emphasis:

- Lock
- Build

Focus on:

- entity boundaries
- invariants
- keeping domain logic clean

### Runtime Or Spine Phase

Main emphasis:

- Slice
- Verify

Focus on:

- queueing and ordering behavior
- state transitions
- deterministic tests for subtle runtime logic

### Policy Or Governance Phase

Main emphasis:

- Lock
- Verify

Focus on:

- determinism
- explicit reason codes
- honest degradation and escalation behavior

### Interface Or Surface Phase

Main emphasis:

- Build
- Close

Focus on:

- inspectability
- trust surface quality
- smallest useful exposure first

## Working Rule

Use the roadmap to know what is being built.

Use this playbook to know how to operate the work.