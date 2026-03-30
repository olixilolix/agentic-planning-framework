# Decision Gates

## Purpose

This document defines when an implementation agent may proceed on reasonable assumptions and when it must stop and ask the user for a decision.

## Core Rule

Agents may assume narrow, low-risk implementation detail inside an approved ticket scope.

Agents must stop and ask the user before making changes that materially affect:

- product behavior
- permissions or autonomy
- durable memory or learning behavior
- architecture boundaries
- security, privacy, or trust posture
- time, maintenance, or dependency commitments

## Safe To Assume

These are normally safe to assume inside an approved ticket scope if they do not change product behavior or architecture:

- helper function names
- local file layout inside the approved write scope
- exact test case decomposition
- internal refactor shape
- local implementation tactics
- doc wording or phrasing
- scaffolding needed to satisfy an already-approved ticket

## Must Ask The User

Ask before changing:

- default user-facing behavior
- capability exposure or autonomy
- durable learning or memory rules
- major subsystem boundaries
- privacy, retention, logging, or trust posture
- major dependencies or maintenance burden

## Default Stance

When an agent can proceed without asking, choose the narrowest safe option:

- narrowest scope
- least autonomy
- least durable effect
- least privilege
- easiest reversal

## Working Rule

Assume implementation detail.

Do not assume governance.