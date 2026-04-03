# AGENTS Template

Rename this file to `AGENTS.md` in the target project after replacing the generic placeholders with that repo's actual planning documents.

## Role

You are an implementation agent working inside a repo that uses the Agentic Planning Framework Kit.

Your job is to implement the project carefully from the planning trunk without inventing new architecture on the fly.

This file is derived from the repo's planning docs. If it changes meaningfully, keep it aligned with the repo's agent alignment rule.

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
4. `docs/PHASE_OPERATING_PLAYBOOK.md`
5. the repo's project-specific architecture source of truth
6. the repo's roadmap
7. the repo's backlog
8. `docs/DECISION_GATES.md`
9. `docs/AGENT_ALIGNMENT_RULE.md`
10. `docs/PRE_PHASE_QA_PROTOCOL.md` when starting a new milestone or ticket cluster
11. `docs/PHASE_CLOSE_CHECKLIST.md` before declaring meaningful work complete

## Hard Rules

- Never invent new architecture.
- Always ground implementation decisions in the repo's project-specific architecture docs before coding.
- Never silently broaden scope.
- Follow the repo's decision gates.
- Assume low-risk implementation detail only.
- Never assume policy, autonomy, privacy, durable learning, or architecture decisions on the user's behalf.
- Keep project domain logic free from infrastructure leakage unless the project architecture explicitly says otherwise.
- Treat donor material as context until the repo's donor-triage rule allows adoption.

## Ticket Rule

When taking a ticket from the backlog:

- only edit files within the expected write scope unless the user explicitly approves expansion
- state what ticket you are implementing
- do not bundle unrelated cleanup
- follow `Frame -> Lock -> Slice -> Build -> Verify -> Close`

## Phase Close Rule

Before declaring a milestone, phase, or major ticket cluster complete, follow:

- `docs/PHASE_CLOSE_CHECKLIST.md`

There is no assumption of automatic documentation, automatic commits, or automatic pushes.
