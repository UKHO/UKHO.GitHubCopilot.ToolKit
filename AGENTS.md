# Agent operating guidance

This file defines the repository-level operating model for agents and contributors who create or maintain the reusable Copilot assets in this toolkit.

## Purpose

Use this guidance to keep agentic work focused, efficient, and reviewable while preserving the repository's existing quality, wiki-first, and reusable-Microsoft-project expectations.

## Core operating rules

1. Prefer one primary outcome per chat, prompt, or agent execution. If the task changes materially, start a fresh thread or explicitly re-scope the work.
2. Plan before acting on any non-trivial task. Do not iterate blindly through repeated trial-and-error.
3. Keep responses lean by default. Avoid unnecessary narration, repeated summaries, or oversized intermediate output.
4. Prefer scripts or reusable automation for repeatable inventory, validation, or transformation work.
5. Cap tool output deliberately by using targeted file reads, narrow searches, and structured output where possible.
6. Use precise evidence when referring to implementation details, preferably with `file:line` references when the medium supports them.
7. Prefer semantic or code-graph search before repeated text grep when that gives a better signal-to-noise ratio.
8. Choose model capability intentionally. Use lower-cost models for routine work when validated, and reserve `gpt-5.5` for higher-judgment tasks.
9. Read stable context before volatile context so repeated work benefits from consistent grounding.
10. Parallelize independent read-only investigation where it improves throughput without reducing clarity.
11. Delegate broad research to subagents when available, then consume and preserve only the useful summary.
12. Record stable operating guidance here and stable repository learnings in `lessons.md` when they are worth reusing.
13. Stop after three failed attempts at the same approach and surface the blocker, evidence, and recommended next move.
14. Prefer targeted diff-based edits over full-file rewrites unless the task genuinely requires replacement.

## How this fits this repository

- `docs/wiki/` remains the source of truth for workflow and repository understanding.
- Repo-wide and scoped instructions remain authoritative for file-specific behavior.
- This file provides the operating style that ties the reusable assets together.
- The rules above should be applied proportionately. Execution and review workflows should follow them strictly, while explanatory documentation may adapt them for clarity.

## Update expectations

Update `AGENTS.md` when a stable execution pattern, constraint, or decision rule should shape future agent behavior across the repository.

Update `lessons.md` when a stable learning from implementation, validation, or maintenance would help future contributors avoid repeat mistakes.

When either file changes repository understanding or workflow guidance, refresh the relevant pages under `docs/wiki/` in the same change.
