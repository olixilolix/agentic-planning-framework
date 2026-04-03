# Agentic Planning Framework Kit

A reusable planning and governance starter kit for human-agent software projects.

This repository is for teams that want a project to have a clear planning trunk before agents start making implementation decisions. It gives you workflow doctrine, decision gates, closeout discipline, and starter templates without pretending to know your product architecture for you.

## What You Get

- a reusable [AGENTS template](AGENTS.template.md) for project-local agent instructions
- a framework doc set for planning, verification, escalation, and closeout in [docs/](docs/README.md)
- starter project templates for stack, boundaries, architecture, roadmap, and backlog in [templates/](templates/README.md)
- a practical sandbox in [examples/](examples/README.md) that pressure-tests the framework against a tiny real project
- lightweight repo hygiene for publishing and maintenance, including a docs validation script and GitHub Actions workflow

## Best Fit

This kit is especially useful for:

- greenfield products with meaningful architecture risk
- repos that want strong human-in-the-loop agent governance
- systems or research work where bounded tickets and explicit escalation matter
- teams that want planning discipline without adopting a heavyweight external framework wholesale

## What This Kit Does Not Do

This repo does not supply:

- your product-specific architecture
- your domain model
- your business logic
- your runtime stack decisions beyond starter templates

## Quick Start

1. Copy this repo, or copy the files you want, into a new or existing project.
2. Rename [AGENTS.template.md](AGENTS.template.md) to `AGENTS.md`.
3. Copy the template files from [templates/](templates/README.md) into the concrete project docs you will actually maintain, such as `STACK.md`, `ARCHITECTURE.md`, `ROADMAP.md`, and `BACKLOG.md`.
4. Fill in the project-specific docs before asking agents to implement meaningful work.
5. Keep the docs in [docs/](docs/README.md) as the reusable workflow and governance spine.
6. Treat your project-specific architecture docs as the authority for system behavior and structure.

## Recommended Reading Order

1. [README.md](README.md)
2. [templates/README.md](templates/README.md)
3. [docs/README.md](docs/README.md)
4. [docs/DEVELOPMENT_FRAMEWORK.md](docs/DEVELOPMENT_FRAMEWORK.md)
5. [docs/DECISION_GATES.md](docs/DECISION_GATES.md)
6. [docs/TEST_CHARTER.md](docs/TEST_CHARTER.md)
7. Your project-local stack, architecture, roadmap, and backlog docs

## Repository Map

- [AGENTS.template.md](AGENTS.template.md): starter agent instructions for a project using this kit
- [docs/README.md](docs/README.md): index of the reusable framework docs
- [docs/DEVELOPMENT_FRAMEWORK.md](docs/DEVELOPMENT_FRAMEWORK.md): canonical workflow model plus pre-phase, closeout, donor, proposal, and alignment rules
- [docs/DECISION_GATES.md](docs/DECISION_GATES.md): when an agent may assume details and when it must escalate
- [docs/TEST_CHARTER.md](docs/TEST_CHARTER.md): minimum quality expectations by layer
- [templates/README.md](templates/README.md): index of project-specific starter templates
- [examples/README.md](examples/README.md): practical framework sandboxes and evaluation artifacts

## Core Operating Model

The kit assumes one simple split of authority:

- project-specific architecture docs decide what the system is
- the framework docs decide how work is framed, gated, verified, and closed

The canonical workflow is:

1. `Frame`
2. `Lock`
3. `Slice`
4. `Build`
5. `Verify`
6. `Close`

## Validation

Run the lightweight validation check before publishing or opening a pull request:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```

That script checks for the expected kit files and verifies that local Markdown links resolve. The same check also runs in GitHub Actions via [.github/workflows/docs-hygiene.yml](.github/workflows/docs-hygiene.yml).

## License

This repository is available under the [MIT License](LICENSE).

## Working Rule

Reuse the framework.

Do not let the framework replace project-specific architecture authority.
