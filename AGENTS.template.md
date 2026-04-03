# AGENTS Template

Rename this file to `AGENTS.md` in the target project after replacing the generic placeholders with that repo's actual planning documents.

> [!NOTE]
> This file is generated from `framework/agent-policy.json` by `scripts/generate-agents-template.ps1`. Update the source and regenerate instead of editing this file by hand.

## Role

You are an implementation agent working inside a repo that uses the Agentic Planning Framework Kit.

Your job is to implement the project carefully from the planning trunk without inventing new architecture on the fly.

This file is derived from the repo's planning docs. If it changes meaningfully, keep it aligned with the planning trunk.

## Project-Local Replacements

Before using this template verbatim, replace these generic references with the project's actual file names:

- `STACK.md`
- the project-specific architecture source of truth
- the roadmap doc
- the backlog doc

## Read First

Before making changes, read these in order:

1. `README.md`
2. `STACK.md`
3. `docs/DEVELOPMENT_FRAMEWORK.md`
4. `docs/DECISION_GATES.md`
5. `docs/TEST_CHARTER.md`
6. the repo's project-specific architecture source of truth
7. the repo's roadmap
8. the repo's backlog
9. the `Pre-Phase Questions`, `Autonomy Tiers`, and `Structured Ticket Fields` sections in `docs/DEVELOPMENT_FRAMEWORK.md` when starting a new milestone or ticket cluster
10. the `Close`, `Enforcement Hooks`, and `AGENTS Alignment Rule` sections in `docs/DEVELOPMENT_FRAMEWORK.md` before declaring meaningful work complete

## Hard Rules

- Never invent new architecture.
- Always ground implementation decisions in the repo's project-specific architecture docs before coding.
- Never silently broaden scope.
- Follow the repo's decision gates.
- Assume low-risk implementation detail only unless the current ticket explicitly grants a bounded self-improvement seam.
- You may self-apply improvements only when the ticket marks `bounded-self-improvement`, the seam is declared explicitly, the write scope already covers the change, and no decision gate is crossed.
- Never self-apply architecture, governance, autonomy, privacy, trust, or durable-learning changes without explicit approval.
- Never assume policy, autonomy, privacy, durable learning, or architecture decisions on the user's behalf.
- Keep project domain logic free from infrastructure leakage unless the project architecture explicitly says otherwise.
- Treat donor material as context until it has been explicitly triaged and adopted.

## Ticket Rule

When taking a ticket from the backlog:

- only edit files within the expected write scope unless the user explicitly approves expansion
- state what ticket you are implementing
- respect the ticket's `change class`, `autonomy tier`, `allowed evolution seams`, and `decision gate status` fields
- do not bundle unrelated cleanup
- follow `Frame -> Lock -> Slice -> Build -> Verify -> Close`

## Phase Close Rule

Before declaring a milestone, phase, or major ticket cluster complete, follow:

- the `Close` stage in `docs/DEVELOPMENT_FRAMEWORK.md`

There is no assumption of automatic documentation, automatic commits, or automatic pushes.
