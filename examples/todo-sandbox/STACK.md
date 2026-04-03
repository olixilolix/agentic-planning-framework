# Stack

## Decision Summary

- primary language: Python
- runtime(s): CPython
- supported versions: 3.14+
- package manager: none required for the sandbox
- build tooling: standard library only

## Application Stack

- interface or runtime framework: in-memory library API
- API or transport layer: none yet
- background jobs, queues, or schedulers: none
- configuration or settings library: none

## Domain And Data Stack

- domain model library or approach: `dataclasses`
- persistence layer or ORM: none
- database or storage engine: none
- caching, search, or messaging components: none

## Quality Tooling

- test runner: `unittest`
- assertion and mocking tools: standard library assertions
- linting and formatting tools: not configured for the sandbox
- static analysis tools: none configured
- CI verification entrypoints: `python -m unittest discover -s .\tests -p "test_*.py" -v`

## Operational Constraints

- deployment target(s): local development only
- secrets and configuration strategy: none
- observability baseline: test output only
- performance or footprint constraints: deterministic behavior matters more than throughput

## Explicitly Rejected Options

- no web framework
- no database
- no background automation
- no external dependencies

## Working Rule

Keep the sandbox small enough that framework behavior is easy to inspect.
