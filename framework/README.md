# Framework Sources

This folder contains machine-readable sources that back the reusable framework.

## Included Files

- [agent-policy.json](agent-policy.json): source of truth for generating [../AGENTS.template.md](../AGENTS.template.md)

## Working Rule

Do not hand-edit generated files when the source in this folder is meant to drive them.

Regenerate [../AGENTS.template.md](../AGENTS.template.md) with:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\generate-agents-template.ps1
```
