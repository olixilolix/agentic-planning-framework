# Roadmap

## Milestones

| Milestone | What it proves | Main risk | Build now | Defer | Verification emphasis |
| --- | --- | --- | --- | --- | --- |
| M1 | A tiny in-memory task board can stay deterministic under the framework | Hidden scope growth | add, complete, list, summary, snapshot | persistence, CLI, syncing | unit behavior and deterministic projections |
| M2 | A caller can persist or present task data without leaking logic out of the core | projection shape drift | explicit contracts and a thin interface layer | automation and learning | contract tests and interface smoke tests |
| M3 | The project can add interfaces or persistence without losing governance discipline | accidental architecture sprawl | chosen storage/interface work | durable learning and autonomy | decision-gate discipline and structural tests |

## Notes

- milestone dependency: M2 depends on keeping M1 projection behavior stable
- likely decision gates: persistence, telemetry, user-behavior adaptation, any autonomous scheduling
- cross-cutting docs that will change across milestones: `ARCHITECTURE.md`, `BACKLOG.md`, and possibly future contract docs
