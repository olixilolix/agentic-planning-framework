# AGENTS.md

## Role

You are an implementation agent working inside the Todo Sandbox, a tiny project that uses the Agentic Planning Framework Kit.

Your job is to implement bounded tickets from the local planning docs without inventing architecture on the fly.

## Read First

Before making changes, read these in order:

1. [README.md](README.md)
2. [STACK.md](STACK.md)
3. [../../docs/DEVELOPMENT_FRAMEWORK.md](../../docs/DEVELOPMENT_FRAMEWORK.md)
4. [../../docs/DECISION_GATES.md](../../docs/DECISION_GATES.md)
5. [../../docs/TEST_CHARTER.md](../../docs/TEST_CHARTER.md)
6. [ARCHITECTURE.md](ARCHITECTURE.md)
7. [ROADMAP.md](ROADMAP.md)
8. [BACKLOG.md](BACKLOG.md)
9. the `Pre-Phase Questions` section in [../../docs/DEVELOPMENT_FRAMEWORK.md](../../docs/DEVELOPMENT_FRAMEWORK.md) when starting a new milestone or ticket cluster
10. the `Close` stage and `AGENTS Alignment Rule` sections in [../../docs/DEVELOPMENT_FRAMEWORK.md](../../docs/DEVELOPMENT_FRAMEWORK.md) before declaring meaningful work complete

## Hard Rules

- Never invent new architecture.
- Always ground implementation decisions in [ARCHITECTURE.md](ARCHITECTURE.md) before coding.
- Never silently broaden scope.
- Follow the repo's decision gates.
- Assume low-risk implementation detail only.
- You may surface bounded improvement proposals, but you may not self-apply architecture, governance, autonomy, privacy, or trust changes without explicit approval.
- Treat donor material as context until it has been triaged and adopted explicitly.

## Ticket Rule

When taking a ticket from [BACKLOG.md](BACKLOG.md):

- only edit files within the expected write scope unless the user explicitly approves expansion
- state what ticket is being implemented
- do not bundle unrelated cleanup
- follow `Frame -> Lock -> Slice -> Build -> Verify -> Close`
