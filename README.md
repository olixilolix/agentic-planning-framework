# Agentic Planning Framework Kit

## Purpose

This package is a reusable planning and governance framework for human-agent software projects.

It is designed for repos that want:

- clear architecture authority
- bounded planning before coding
- explicit decision escalation
- agent alignment with human sovereignty
- repeatable review and closeout discipline

## What This Package Contains

- a generic `AGENTS` template
- reusable workflow doctrine
- reusable decision and escalation rules
- reusable pre-phase and phase-close rituals
- reusable test and donor-triage doctrine
- starter templates for stack, boundaries, architecture, roadmap, and backlog

## What This Package Does Not Contain

- your product-specific architecture
- your domain model
- your business logic
- your runtime stack decisions beyond templates

## Quick Start

1. Copy this package into a new or existing repo.
2. Rename `AGENTS.template.md` to `AGENTS.md`.
3. Copy the files in `templates/` into the names your project will actually use, for example:
   - `STACK.template.md` -> `STACK.md`
   - `ARCHITECTURE.template.md` -> your architecture source-of-truth doc
   - `ROADMAP.template.md` -> your roadmap doc
   - `BACKLOG.template.md` -> your backlog doc
4. Fill in the project-specific templates before asking agents to implement meaningful work.
5. Keep `docs/` as the reusable workflow and governance spine.
6. Treat your project-specific architecture docs as the authority for product behavior.

## Best Fit

This kit is especially useful for:

- greenfield projects with significant architecture risk
- repos that want strong human-in-the-loop agent governance
- research or systems projects where planning quality matters
- teams that want bounded tickets and explicit escalation rules

## Included Docs

For the reusable framework docs, start with:

1. `docs/DEVELOPMENT_FRAMEWORK.md`
2. `docs/DECISION_GATES.md`
3. `docs/PRE_PHASE_QA_PROTOCOL.md`
4. `docs/PHASE_CLOSE_CHECKLIST.md`
5. `docs/TEST_CHARTER.md`
6. `docs/AGENT_ALIGNMENT_RULE.md`

There is also a lightweight index at `docs/README.md`.

## Included Files

```text
agentic-planning-framework/
├── README.md
├── AGENTS.template.md
├── .gitattributes
├── docs/
│   ├── README.md
│   ├── DEVELOPMENT_FRAMEWORK.md
│   ├── DECISION_GATES.md
│   ├── PRE_PHASE_QA_PROTOCOL.md
│   ├── PHASE_CLOSE_CHECKLIST.md
│   ├── TEST_CHARTER.md
│   ├── DONOR_TRIAGE_CHECKLIST.md
│   ├── AGENT_ALIGNMENT_RULE.md
│   └── PHASE_OPERATING_PLAYBOOK.md
└── templates/
    ├── STACK.template.md
    ├── SYSTEM_BOUNDARIES.template.md
    ├── ARCHITECTURE.template.md
    ├── ROADMAP.template.md
    └── BACKLOG.template.md
```

## Adoption Rule

Use this kit to structure work.

Do not let the kit become a substitute for project-specific architecture.

## Working Rule

Reuse the framework.

Do not let the framework replace project-specific architecture authority.
