---
description: 'Standardize lean authoring for Copilot governance, agents, prompts, and templates so reusable assets stay focused, evidence-based, and token-efficient.'
applyTo: 'AGENTS.md, lessons.md, .github/copilot-instructions.md, .github/agents/**/*.agent.md, .github/prompts/**/*.prompt.md, .github/templates/**/*.template.md'
---

# Lean authoring rules for Copilot assets

## Overview

These instructions define how to author and maintain the repository's reusable Copilot governance files, agents, prompts, and templates. They keep assets focused, economical, and evidence-based without weakening quality, wiki alignment, or reviewer clarity.

## Scope

Applies to: `AGENTS.md, lessons.md, .github/copilot-instructions.md, .github/agents/**/*.agent.md, .github/prompts/**/*.prompt.md, .github/templates/**/*.template.md`

- Applies when creating or updating root governance files, repo-wide Copilot guidance, custom agents, prompt files, and reusable templates.
- Complements `./AGENTS.md`, `./lessons.md`, and the existing repo-wide and scoped instruction files.
- Does not require human-facing explanatory documentation to become unnaturally terse; apply the strictest output-minimization rules to executable asset workflows.

## Instructions

### MUST

- Give each asset one clear primary outcome and keep the file name, title, description, and workflow aligned to that outcome.
- Require plan-first behavior for tasks that are more than trivial or need more than two steps.
- Prefer the smallest set of repository reads, searches, and tool calls needed to complete the task safely.
- Prefer semantic or code-graph search before iterative plain-text grep when those capabilities are available and appropriate.
- Cap investigation output deliberately by using targeted file reads, narrow search scopes, line ranges, and structured results.
- Prefer reusable scripts or automation for repeatable inventory, validation, transformation, or consistency checks.
- Use precise repository evidence, preferably `file:line` references, when citing implementation details, review findings, or non-obvious repository facts.
- State model choice intentionally and prefer cheaper models for routine workflows only when that choice has been validated; otherwise keep the current validated model.
- Direct contributors to review `./AGENTS.md` and `./lessons.md` when authoring or changing reusable repository assets.
- Update `./AGENTS.md` when a stable repository-wide operating rule emerges.
- Update `./lessons.md` when implementation, validation, or maintenance reveals a stable lesson worth preserving.
- Stop after three failed attempts at the same approach and surface the blocker, evidence, and recommended next move.
- Prefer targeted diff-style edits over full-file rewrites unless replacement is genuinely required.

### SHOULD

- Prefer concise response-style guidance that starts with the answer, draft, or next concrete action.
- Prefer one-question-at-a-time clarification loops and infer safe defaults where they do not change scope or intent.
- Prefer stable context before volatile context so repeated work benefits from predictable grounding.
- Prefer parallel read-only investigation when independent inputs can be gathered without harming clarity.
- Prefer concise final outputs with exact output shapes rather than chatty wrappers around the real deliverable.
- Prefer extending existing agents, prompts, templates, or instructions over creating near-duplicate assets.

### MUST NOT

- MUST NOT combine multiple unrelated outcomes into one reusable asset when separate assets would keep invocation and maintenance clearer.
- MUST NOT require broad exploratory searching when a narrower, evidence-backed lookup can answer the question.
- MUST NOT add narration, preambles, or end-of-turn summaries to execution-oriented assets when a direct action-oriented response would suffice.
- MUST NOT present repository defaults or model preferences as absolute mandates when the asset itself needs to document a justified deviation.
- MUST NOT duplicate stable guidance in multiple assets when the rule can live once in `AGENTS.md`, `lessons.md`, or a scoped instructions file and be referenced from there.

## Output and Validation (optional)

- Expected artifacts: focused governance, agent, prompt, and template files that encode lean operating rules without losing repository quality controls.
- Validate success by checking that:
  - each asset describes one primary outcome
  - planning behavior is explicit for non-trivial workflows
  - investigation guidance prefers narrow, capped, evidence-based reads and searches
  - repeatable checks are pushed toward scripts or automation where practical
  - stable operating rules and lessons are referenced from `AGENTS.md` and `lessons.md`

## References (optional)

- `./AGENTS.md`
- `./lessons.md`
- `./.github/copilot-instructions.md`
- `./docs/wiki/index.md`
- `./docs/wiki/workflow-overview.md`
- `./docs/wiki/instructions-overview.md`

## Notes (optional)

- Apply these rules proportionately. Execution and review assets should be the strictest; teaching or explanatory assets may stay slightly more narrative when that materially improves clarity.
