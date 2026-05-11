# Workflow overview

This page explains the recommended workflow that the repository supports. It combines the repository's reusable agents and prompts into a staged delivery model for Microsoft project work.

Templates are part of that model as the reusable scaffolds behind many generated artifacts. They are not a separate workflow stage. Instead, prompts, agents, and contributors use the templates under `.github/templates/` to create consistent instructions, prompts, plans, requirements, specifications, and review documents.

In this repository, the live `docs/wiki/` folder documents the toolkit itself. When this page refers to `create-wiki.agent.md`, it refers to a reusable downstream-project asset that teams can use in other repositories to generate a project-specific wiki baseline under `docs/wiki/`.

For any new project that does not already have an established history of using GitHub Copilot, start by invoking `create-wiki.agent.md` to create the wiki baseline under `docs/wiki/`. After the wiki is created, review the existing Copilot instruction files, identify project areas that are not yet covered, and create any missing scoped instruction files by using `create-instructions.prompt.md` before continuing with business requirements, systems analysis, or work-package delivery.

Once the wiki baseline exists, treat the relevant wiki pages as the source of truth for planning and project updates. Prompts, agents, templates, and contributors should consult the wiki before drafting plans, requirements, specifications, implementation changes, reviews, or workflow updates, and refresh the affected wiki pages after each change so the wiki remains aligned with the current project state.

Where execution agents already embed the required wiki refresh in their own behavior, treat that wiki work as part of the execution step rather than as a separate stage.

## Workflow summary

The repository is organized around a progression from discovery to delivery, then to quality hardening:

1. create the wiki baseline for any new project that does not already have established Copilot context
2. review relevant wiki pages before every later planning or project-update task
3. review existing Copilot instructions and close any coverage gaps with new scoped instructions
4. establish business intent
5. establish system understanding
6. define one work package
7. design the technical approach
8. plan delivery
9. execute delivery
10. review and strengthen testing
11. review and improve maintainability

## Primary workflow sequence

The standard sequence for a new package or feature is:

1. `create-wiki.agent.md` for any existing project that does not already have established Copilot history
2. review the relevant `docs/wiki/` pages for the task at hand
3. review `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` for current coverage
4. `create-instructions.prompt.md` for any uncovered language, framework, folder, file type, or workflow areas
5. `create-business-requirements.agent.md`
6. `create-systems-analysis.agent.md`
7. `create-requirements.agent.md`
8. `create-technical-spec.agent.md`
9. `create-delivery-plan.agent.md`
10. `execute-delivery-plan.agent.md` (including any required wiki updates)
11. `review-test-approach.agent.md`
12. `create-test-plan.agent.md`
13. `execute-test-plan.agent.md` (including any required wiki updates)
14. `review-refactoring-approach.agent.md`
15. `create-refactoring-plan.agent.md`
16. `execute-refactoring-plan.agent.md` (including any required wiki updates)

## Stage breakdown

### 1. Project foundation

This stage establishes the wiki, business, and system-level baseline.

| Asset | Output | Purpose |
| --- | --- | --- |
| `create-wiki.agent.md` | `docs/wiki/**/*.md` | Creates or refreshes the wiki baseline that grounds later Copilot-assisted workflow steps |
| `create-business-requirements.agent.md` | `docs/business-requirements.md` | Captures goals, scope, stakeholders, and business requirements |
| `create-systems-analysis.agent.md` | `docs/systems-analysis.md` | Refines business intent into actors, use cases, rules, quality attributes, and work-package candidates |

### 2. Work-package definition

This stage turns one candidate package into implementable work.

| Asset | Output | Purpose |
| --- | --- | --- |
| `create-requirements.agent.md` | `docs/00x-work/requirements.md` | Defines detailed functional, non-functional, and supporting requirements |
| `create-technical-spec.agent.md` | `docs/00x-work/technical-specification.md` | Defines implementable design, traceability, testing strategy, configuration expectations, and structure |
| `create-delivery-plan.agent.md` | `docs/00x-work/plans/001-delivery-plan.md` | Breaks the package into ordered delivery steps with validation gates |

### 3. Delivery

This stage implements the work and validates it.

| Asset | Output | Purpose |
| --- | --- | --- |
| `execute-delivery-plan.agent.md` | implemented code plus updated plan | Executes the numbered plan, updates checklist progress, runs validation gates, and refreshes affected wiki pages when needed |

### 4. Test review and mitigation loop

This stage adds an independent testing review after delivery.

| Asset | Output | Purpose |
| --- | --- | --- |
| `review-test-approach.agent.md` | numbered test review report | Identifies missing coverage, weak tests, and test risks |
| `create-test-plan.agent.md` | numbered test plan | Converts test findings into traceable work items |
| `execute-test-plan.agent.md` | hardened tests plus updated plan | Implements test improvements with validation, rollback awareness, and any required wiki refresh |

### 5. Refactoring review and mitigation loop

This stage adds an independent maintainability review after delivery or test hardening.

| Asset | Output | Purpose |
| --- | --- | --- |
| `review-refactoring-approach.agent.md` | numbered refactoring review report | Identifies duplication, complexity, coupling, cohesion, and design risks |
| `create-refactoring-plan.agent.md` | numbered refactoring plan | Converts refactoring findings into prioritized work |
| `execute-refactoring-plan.agent.md` | refactored code plus updated plan | Applies maintainability improvements while preserving behavior and any required wiki refresh |

## Recommended usage patterns

### Pattern A: New feature or new package

Use the full sequence from the create-wiki agent through refactoring execution when the project is new or does not yet have established Copilot context. Create the wiki first so Copilot has enough grounding before business requirements, systems analysis, and work-package documentation are produced. Immediately after the wiki is created, review the current instruction files and use `create-instructions.prompt.md` to add any missing scoped guidance before delivery work begins. Throughout the rest of the workflow, consult the relevant wiki pages before each planning or project-update task. When delivery, test, or refactoring execution changes wiki-documented behavior or guidance, the corresponding execution agent should refresh the affected wiki pages as part of that step.

### Pattern B: Existing package that only needs implementation

Use:

1. `create-wiki.agent.md` if the project does not already have a wiki baseline or established Copilot context
2. review the relevant `docs/wiki/` pages for the task at hand
3. review `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` for project coverage
4. `create-instructions.prompt.md` for any uncovered language, framework, folder, file type, or workflow areas
5. `create-requirements.agent.md` if the work package requirements do not already exist
6. `create-technical-spec.agent.md` if the technical specification does not already exist
7. `create-delivery-plan.agent.md` if no delivery plan exists
8. `execute-delivery-plan.agent.md`, which includes any required wiki updates within execution
9. optional test and refactoring review loops, each with wiki review before work and wiki refresh handled within the relevant execution agent

### Pattern C: Existing package that mainly needs quality hardening

Use:

1. `create-wiki.agent.md` if the project does not already have a wiki baseline or established Copilot context
2. review the relevant `docs/wiki/` pages for the task at hand
3. review `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` for project coverage
4. `create-instructions.prompt.md` for any uncovered language, framework, folder, file type, or workflow areas
5. `review-test-approach.agent.md`
6. `create-test-plan.agent.md`
7. `execute-test-plan.agent.md`, which includes any required wiki updates within execution
8. `review-refactoring-approach.agent.md`
9. `create-refactoring-plan.agent.md`
10. `execute-refactoring-plan.agent.md`, which includes any required wiki updates within execution

### Pattern D: Repository tooling and standards work

Use the utility prompts and repository authoring agents when the goal is to extend the reusable Copilot asset library rather than to deliver a business feature.

Typical sequence:

1. review the relevant `docs/wiki/` pages for the workflow or asset area being assessed
2. `review-instruction-coverage.agent.md` when you need an evidence-based report of instruction coverage gaps against the wiki baseline
3. `create-instructions.prompt.md` to add any approved missing scoped instruction files
4. refresh the affected `docs/wiki/` pages after the instruction set changes

## How this aligns with Visual Studio Copilot

Microsoft Learn guidance for Visual Studio separates several related concepts:

- **custom instructions** for reusable project context
- **prompt files** for reusable chat prompts
- **custom agents** for specialist workflows in agent mode
- **agent skills** for focused task-specific guidance discoverable by agents

This repository uses all four concepts, but organizes them into a delivery workflow so teams can move from idea to implementation and then through quality review.

The repository also adds a template layer under `.github/templates/`. Templates are repository scaffolds rather than a Visual Studio Copilot asset type, but they are an important part of how this workflow stays consistent. Prompts and agents frequently use those templates to generate artifacts with a predictable structure.

## When to use prompts instead of agents

Use prompt files when you want reusable guidance that a person invokes intentionally in chat. Use agents when you want a specialized assistant persona with its own instructions and optional tool configuration in agent mode.

## Related pages

- [Agents overview](./agents-overview.md)
- [Prompts overview](./prompts-overview.md)
- [Instructions overview](./instructions-overview.md)
- [Templates overview](./templates-overview.md)
- [Skills overview](./skills-overview.md)

## External references

- [Use built-in and custom agents with GitHub Copilot](https://learn.microsoft.com/visualstudio/ide/copilot-specialized-agents?view=visualstudio)
- [Get started with GitHub Copilot agent mode](https://learn.microsoft.com/visualstudio/ide/copilot-agent-mode?view=visualstudio)
- [Customize chat responses and set context](https://learn.microsoft.com/visualstudio/ide/copilot-chat-context?view=visualstudio)
