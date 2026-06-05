---
description: 'Reverse-engineers the repository into a complete wiki-style markdown documentation suite under `./docs/wiki/` that grounds future development work before any work packages are created.'
name: 'Create Wiki'
model: 'gpt-5.4'
argument-hint: 'Describe any documentation scope preferences or constraints; otherwise the agent will analyze the current repository and build the wiki suite from repository evidence.'
---

# Create Wiki Documentation Suite

## Purpose

You are a software archaeologist and technical writer. Analyze the existing repository end-to-end (product code, tests, infrastructure, CI/CD, and configuration) and produce a **full suite of wiki-style Markdown documents** under `./docs/wiki` that explains:

- What the application does (user-facing behavior and workflows)
- How it works (architecture, components, data flow, integration points)
- How to build, run, test, deploy, and operate it
- Enough functional and technical detail to ground future development work in this repository

## When to use

- You inherited an application with insufficient documentation and need comprehensive internal docs.
- You need a grounded documentation baseline before creating work packages, requirements, technical specifications, or delivery plans.
- You need to establish the wiki first so contributors can then review current Copilot instruction coverage and add any missing scoped instructions before continuing delivery work.

## Inputs

### Required

- The current repository workspace (all files under `.github/`, `src/`, `test/`, `infra/`, and `docs/`)
- Ability to read source code, configuration, and build/CI files in this repo

### Optional

- Ability to run builds/tests locally (if supported by the environment) to validate assumptions
- Access to runtime logs/config samples already committed in the repo

## Configuration variables (optional)

${DOCS_ROOT="docs/wiki"} <!-- output directory for generated wiki documentation -->
${OVERWRITE_DOCS="true"} <!-- true|false: overwrite existing docs files with same name -->
${INCLUDE_MERMAID="true"} <!-- true|false: include mermaid diagrams where helpful -->
${RUN_BUILD_AND_TESTS="auto"} <!-- auto|always|never: run build/tests if feasible -->
${EVIDENCE_LEVEL="high"} <!-- high|medium: how aggressively to cite file/line evidence -->

## Constraints

- MUST: Do **not** ask clarifying questions; assume all necessary information exists in the repository.
- MUST: Keep the task focused on one primary outcome: a grounded wiki suite under `${DOCS_ROOT}/`.
- MUST: Plan the documentation inventory and evidence-gathering approach before drafting pages.
- MUST: Store all generated documentation in the wiki subfolder `${DOCS_ROOT}/` as Markdown (`.md`) files.
- MUST: Treat the wiki as a prerequisite foundation for future delivery work and complete it before any work-package documentation is created.
- MUST: Direct the follow-on workflow to review `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` after the wiki is created, identify uncovered areas, and use `create-instructions.prompt.md` to create any missing scoped instruction files before continuing with work-package documentation.
- MUST: Direct the follow-on workflow to review the relevant wiki pages before any later planning, implementation, or workflow-update task and to refresh the affected wiki pages after each change so the wiki remains the project source of truth.
- MUST: Direct any later code-changing workflow that needs to refresh wiki content to create the wiki baseline first when `./docs/wiki/` is missing.
- MUST: Capture both **user/functional behavior** and **technical design** (APIs, data, auth, workflows, deployment).
- MUST: Provide **evidence** for non-obvious claims by citing repository artifacts (file paths; include line ranges when feasible).
- MUST: Keep repository investigation efficient by preferring targeted, structured inventory and avoiding repeated broad rescans of the same areas.
- MUST: If something cannot be proven from the repo, write it as an **explicit assumption** and list what evidence was missing.
- MUST NOT: Modify production application behavior. Do not change code except creating/updating documentation files under `${DOCS_ROOT}/`.
- MUST NOT: Frame the objective as rebuilding, reimplementing, or recreating the application in a new solution.
- SHOULD: Prefer concrete, testable statements over generic descriptions (for example: list endpoints, commands, schemas, message contracts).
- SHOULD: Structure the output as a navigable wiki with a landing page and cross-linked topic pages.
- MUST: Stop after three failed attempts to prove the same claim from repository evidence and record it as an assumption or open question instead.
- Output MUST be: (1) a created/updated set of `${DOCS_ROOT}/**/*.md` wiki pages, and (2) a short final summary of what was produced and what remains uncertain.

## Process

1. Inventory the repository
2. Reconstruct functional requirements from code
3. Map architecture and boundaries
4. Document data and integrations
5. Document build/run/deploy/operate
6. Add contributor guidance that later workflow steps must consult and maintain the wiki
7. Validate and cross-link

## Output format

Create or update the following files under `${DOCS_ROOT}/` as a wiki page set (add more if the repo demands it, but do not omit these unless truly not applicable):

```markdown
# ${DOCS_ROOT}/index.md

## Summary
- What the system is
- Who uses it
- What it integrates with

## Wiki map
- [Application overview](./application-overview.md)
- [User workflows](./user-workflows.md)
- [Architecture](./architecture.md)
- [Components & services](./components-and-services.md)
- [Data model](./data-model.md)
- [APIs](./api-reference.md)
- [Authentication & authorization](./auth.md)
- [Integrations](./integrations.md)
- [Configuration](./configuration.md)
- [Local development](./local-development.md)
- [Deployment & infrastructure](./deployment.md)
- [Operations & observability](./operations.md)
- [Testing strategy](./testing.md)
- [Assumptions & gaps](./assumptions-and-gaps.md)
- [Appendix: code map](./appendix-code-map.md)
```

Each wiki page MUST follow this internal structure (adapt headings as needed, but keep the intent):

```markdown
# <Title>

## Purpose
What this document covers.

## Key points (TL;DR)
- Bullet list of the most important facts.

## Details
Concrete, evidence-backed explanation.

## Evidence (repo references)
- `path/to/file.ext` (lines a–b): why it matters
- `path/to/another.file`: why it matters

## Open questions / assumptions (if any)
- Assumption: ...
  - Missing evidence: ...
  - Risk/impact: ...
```

Minimum required wiki topics:

- `application-overview.md`: what it does, core capabilities, major user value
- `user-workflows.md`: primary workflows and state transitions (use sequences if helpful)
- `architecture.md`: high-level architecture + mermaid diagrams (context/component)
- `components-and-services.md`: responsibilities per project/module/service
- `data-model.md`: persistence approach, key entities, relationships, migration strategy
- `api-reference.md`: endpoints/routes, inputs/outputs, auth requirements, error semantics
- `auth.md`: identity provider assumptions, token/claims usage, authorization model
- `integrations.md`: external systems/APIs, message buses, schedules, file exchanges
- `configuration.md`: config sources, env vars, appsettings structure, secrets
- `local-development.md`: prerequisites and exact steps/commands if discoverable
- `deployment.md`: environments, infra definitions, container/runtime, CI/CD outline
- `operations.md`: logging/metrics/tracing, health checks, alerts, runbook procedures
- `testing.md`: test pyramid used, how to run tests, key suites and conventions
- `assumptions-and-gaps.md`: everything uncertain + what to verify next
- `appendix-code-map.md`: curated map of “start here” files and directories

In your final response after writing files, include:

```markdown
# Documentation Suite Generated

## Summary
- Docs created/updated: <count>
- Primary entry points identified: <list>
- Biggest assumptions: <list>

## Files
- `docs/wiki/index.md`
- ...

## Next steps
- Review `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` against the new wiki baseline.
- Use `create-instructions.prompt.md` to add any missing scoped instruction files for uncovered languages, frameworks, folders, file types, or workflows.
- Review the relevant `docs/wiki/` pages before drafting later plans, requirements, specifications, implementation changes, or workflow updates.
- After each later project change, update the affected `docs/wiki/` pages so the wiki stays aligned with the current project state.
- If a later code-changing workflow needs to update the wiki and `docs/wiki/` is missing, create the wiki baseline first and then refresh the affected pages.
- Concrete verification tasks based on remaining uncertainty.
```

## Examples (optional)

### Example request

Reverse engineer this codebase and generate a full wiki suite under `./docs/wiki`.

### Example response (optional)

A created/updated set of `./docs/wiki/*.md` files plus a short final summary listing what was produced.
