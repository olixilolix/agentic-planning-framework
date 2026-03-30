# Pre-Phase Q&A Protocol

## Purpose

This document defines the Q&A session to run before starting a new milestone or significant ticket cluster.

## Core Rule

Before a new phase or milestone begins, pause and answer bounded questions for that phase.

The goal is not to re-architect the system every time.

The goal is to surface:

- assumptions
- failure cases
- tests
- documentation updates
- ticket boundaries
- gated user decisions

before coding starts.

## Required Questions

1. What is this phase proving?
2. What docs are the source of truth for it?
3. What hidden failure modes are most likely in this phase?
4. What tests must pass before we call it complete?
5. What docs or contracts may need updating during the phase?
6. Are any donor ideas being introduced, and if so, did they pass triage?
7. Are any ticket write scopes too narrow for the planned work?
8. Which decisions in this phase are gated and must come back to the user instead of being assumed?
9. Which stage matters most in this phase: Frame, Lock, Slice, Build, Verify, or Close?

## Output Shape

A good pre-phase Q&A outcome should produce:

- phase goal restatement
- expected risky edges
- minimum tests
- likely doc touchpoints
- explicit no-touch areas
- explicit gated decisions, if any

## Working Rule

If the Q&A reveals a missing contract, operational rule, or likely decision-gate crossing, patch the plan before implementation depends on guesswork.