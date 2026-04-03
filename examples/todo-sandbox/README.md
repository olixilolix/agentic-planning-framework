# Todo Sandbox

This is a tiny Python project embedded inside the framework repo to test whether the framework can guide real work instead of only describing it.

It uses the root-level framework docs in [../../docs/](../../docs/README.md) and fills in the project-local planning trunk here in the sandbox folder.

## Goal

Provide a deliberately small task-board domain so the framework can be exercised against:

- a normal bounded implementation ticket
- a gated request that should force escalation
- an improvement proposal that should surface without silently rewriting the project

## Project Files

- [AGENTS.md](AGENTS.md)
- [STACK.md](STACK.md)
- [SYSTEM_BOUNDARIES.md](SYSTEM_BOUNDARIES.md)
- [ARCHITECTURE.md](ARCHITECTURE.md)
- [ROADMAP.md](ROADMAP.md)
- [BACKLOG.md](BACKLOG.md)
- [EVALUATION.md](EVALUATION.md)

## Code Files

- [src/task_board.py](src/task_board.py)
- [tests/test_task_board.py](tests/test_task_board.py)

## Verification

```powershell
python -m unittest discover -s .\tests -p "test_*.py" -v
```
