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

## Suggested Use

1. Copy this package into a new repo.
2. Rename `AGENTS.template.md` to `AGENTS.md`.
3. Fill in the files in `templates/` for the new project.
4. Keep `docs/` as the reusable workflow and governance spine.
5. Treat your new project-specific architecture docs as the authority for product behavior.

## Included Files

```text
framework-kit/
├── README.md
├── AGENTS.template.md
├── docs/
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

## Working Rule

Reuse the framework.

Do not let the framework replace project-specific architecture authority.