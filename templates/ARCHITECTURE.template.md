# Architecture Template

Copy this file into the target repo as the architecture source of truth, then replace the prompts with concrete structure.

## Canonical Architecture Summary

- one-paragraph description of the system shape:
- the main architectural bet being made:
- the biggest risks this architecture is meant to control:

## Module Or Directory Map

- top-level module or directory:
  purpose:
  may depend on:
  must not depend on:
- top-level module or directory:
  purpose:
  may depend on:
  must not depend on:

## Layer Boundaries

- domain layer rules:
- application layer rules:
- infrastructure layer rules:
- interface layer rules:

## Runtime Shell And Composition Root

- how the process starts:
- where dependencies are wired:
- where configuration is read:
- where cross-cutting concerns live:

## State Ownership

- persistent state owner:
- transient runtime state owner:
- concurrency or ordering constraints:
- error and retry model:

## Integration Boundaries

- external APIs or providers:
- storage boundaries:
- messaging or event boundaries:
- serialization or contract boundaries:

## Testing Seams

- pure units that should stay easy to test:
- fakes or stubs that should exist:
- smoke or startup paths that need coverage:

## Change Control

- changes that may be handled as normal implementation detail:
- changes that require explicit architecture approval:

## Working Rule

Keep this architecture specific enough that agents do not invent structure on the fly.
