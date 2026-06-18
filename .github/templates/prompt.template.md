# Generic Prompt Template

Copy this file content into a new `*.prompt.md` file and fill in the placeholders.

````markdown
---
agent: 'agent' # one of: agent | ask | Plan
description: '<one sentence describing what this prompt does>'

# Strongly recommended
name: <kebab-case-short-name>
model: 'gpt-5.4' # or the cheapest validated model that still meets the prompt's quality bar

# Optional
# tools: ['search', 'web/fetch', 'runCommands', ...]
# tags: [domain, framework, task-type]
---

# <Prompt Title>

## Purpose

<Describe the role the assistant should take and the outcome it must produce.>

## When to use

- <Use case 1>
- <Use case 2>

## Inputs

### Required

- <What the user must provide (files, URLs, requirements, constraints)>

### Optional

- <Optional context, preferences, tech choices>

## Configuration variables (optional)

${VAR_NAME="default"} <!-- explain what this controls -->

## Constraints

- MUST: <non-negotiable requirement>
- MUST: Keep the prompt focused on a single primary outcome.
- MUST: Plan before acting when the workflow is non-trivial.
- MUST: Review the relevant `docs/wiki/` pages before planning work, guiding project updates, or changing workflow assets.
- MUST: Review `./AGENTS.md` and `./lessons.md` when the prompt creates or changes reusable repository assets.
- MUST: Update the affected `docs/wiki/` pages after changes when project understanding, workflow guidance, implementation guidance, or usage guidance has changed.
- MUST: Prefer targeted reads, narrow searches, and capped investigation output.
- MUST: Use precise repository evidence, preferably `file:line` references, when the prompt cites implementation facts or review findings.
- MUST: Stop after three failed attempts at the same approach and surface the blocker.
- MUST NOT: <prohibited behavior>
- MUST NOT: Combine multiple unrelated outcomes into one reusable prompt.
- SHOULD: <preferred behavior>
- SHOULD: Ask one clarifying question at a time and infer safe defaults where that does not change scope or intent.
- SHOULD: Prefer scripts or reusable automation for repeatable checks.
- Output MUST be: <format>

## Process

1. <Step 1>
2. <Step 2>
3. <Step 3>
4. <Keep outputs lean, evidence-based, and exact to the requested format>

## Output format

<Specify exactly what the assistant should return.>

```markdown
# <Output Title>

## Summary

## Details

## Next steps
```

## Examples (optional)

### Example request

<user request example>

### Example response (optional)

<short example of the expected shape of the answer>
````
