# Workflow overview

This page explains the recommended workflow that the repository supports. It combines the repository's reusable agents and prompts into a staged delivery model for Microsoft project work.

Templates are part of that model as the reusable scaffolds behind many generated artifacts. They are not a separate workflow stage. Instead, prompts, agents, and contributors use the templates under `.github/templates/` to create consistent instructions, prompts, plans, requirements, specifications, and review documents.

In this repository, the live `docs/wiki/` folder documents the toolkit itself. When this page refers to `create-wiki.agent.md`, it refers to a reusable downstream-project asset that teams can use in other repositories to generate a project-specific wiki baseline under `docs/wiki/` when an existing project with implementation history has no wiki baseline.

For an existing project that does not already have a wiki baseline, invoke `create-wiki.agent.md` to establish `docs/wiki/` before later planning or project-update work. For a new project, do not treat wiki creation as a separate foundation stage. Instead, create or refresh the relevant wiki pages as the project is delivered so the documentation grows with the implemented solution.

Once the relevant wiki pages exist, treat them as the source of truth for planning and project updates. Prompts, agents, templates, and contributors should consult the wiki before drafting plans, requirements, specifications, implementation changes, reviews, or workflow updates, and refresh the affected wiki pages after each change so the wiki remains aligned with the current project state.

Where execution agents already embed the required wiki refresh in their own behavior, treat that wiki work as part of the execution step rather than as a separate stage.

Within this repository, the token-thrift operating style documented in `AGENTS.md`, `lessons.md`, and `agentic-assets.instructions.md` acts as an efficiency layer over the staged workflow rather than replacing it. Contributors should still follow the same discovery, planning, execution, review, and wiki-refresh sequence; they should simply do it with tighter scope control, narrower evidence gathering, and more repeatable automation.

## Workflow summary

The repository is organized around a progression from discovery to delivery, then to quality hardening:

1. create the wiki baseline only when onboarding an existing project with implementation history but no wiki baseline
2. review relevant wiki pages before every later planning or project-update task once those pages exist
3. review `AGENTS.md` and `lessons.md` when updating reusable repository assets so operating guidance and durable learnings are taken into account
4. establish business intent
5. establish system understanding
6. review instruction coverage against the business and system baseline by using `review-instruction-coverage.agent.md` and close any approved coverage gaps with new scoped instructions
7. define one work package
8. design the technical approach
9. plan delivery
10. execute delivery, including creating or refreshing wiki content for new projects as the implementation takes shape
11. review and strengthen testing
12. review and improve maintainability

## Primary workflow sequence

For a new package or feature, use the standard sequence below. If an existing project with implementation history has no wiki baseline, run `create-wiki.agent.md` before this sequence. For a new project, create or refresh the relevant wiki pages within the execution stages as delivery work progresses. Use `review-instruction-coverage.agent.md` before `create-instructions.prompt.md` when assessing instruction coverage and identifying approved scoped guidance to add.

The standard sequence is:

1. `create-business-requirements.agent.md` for the project
2. `create-systems-analysis.agent.md` for the project
3. `review-instruction-coverage.agent.md`
4. `create-instructions.prompt.md` for any approved missing scoped guidance
5. `create-requirements.agent.md` for the first work package
6. `create-technical-spec.agent.md` for the first work package
7. `create-delivery-plan.agent.md` for the first work package
8. `execute-delivery-plan.agent.md` (including any required wiki updates)
9. `review-test-approach.agent.md`
10. `create-test-plan.agent.md`
11. `execute-test-plan.agent.md` (including any required wiki updates)
12. `review-refactoring-approach.agent.md`
13. `create-refactoring-plan.agent.md`
14. `execute-refactoring-plan.agent.md` (including any required wiki updates)

## Stage breakdown

### 1. Project foundation

This stage establishes the business and system baseline first, then reviews instruction coverage against that context. If an existing project with implementation history has no wiki baseline, bootstrap it before or alongside this stage. For a new project, create or refresh wiki content during delivery instead of treating it as a separate foundation activity.

| Asset | Output | Purpose |
| --- | --- | --- |
| `create-business-requirements.agent.md` | `docs/business-requirements.md` | Captures goals, scope, stakeholders, and business requirements |
| `create-systems-analysis.agent.md` | `docs/systems-analysis.md` | Refines business intent into actors, use cases, rules, quality attributes, and work-package candidates |
| `review-instruction-coverage.agent.md` | instruction coverage review report | Assesses current instruction coverage against the business, system, and wiki context before new scoped guidance is added |
| `create-instructions.prompt.md` | scoped instruction updates | Adds approved instruction guidance for uncovered language, framework, folder, file type, or workflow areas |

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
| `execute-delivery-plan.agent.md` | implemented code plus updated plan | Executes the numbered plan, updates checklist progress, runs validation gates, and creates or refreshes affected wiki pages when needed |

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

For a new project, use the full sequence from business requirements through refactoring execution, with `review-instruction-coverage.agent.md` following business and systems discovery and preceding `create-instructions.prompt.md`, and create or refresh wiki pages during delivery, test, and refactoring execution as the implementation becomes real. For an existing project with implementation history but no wiki baseline, create the wiki first so Copilot has enough grounding before later planning and project-update work. After the wiki is available for an existing project, use `review-instruction-coverage.agent.md` to assess the current instruction set and use `create-instructions.prompt.md` to add any approved missing scoped guidance before delivery work begins. Throughout the rest of the workflow, consult the relevant wiki pages before each planning or project-update task. When delivery, test, or refactoring execution changes wiki-documented behavior or guidance, the corresponding execution agent should refresh the affected wiki pages as part of that step.

### Pattern B: Existing package that only needs implementation

Use this pattern when the package already exists and mainly needs implementation work. If the project already has relevant wiki pages, start by reviewing them. If the project is an existing project with implementation history but no wiki baseline, create that baseline first and then continue with the package workflow.

Use:

1. `create-wiki.agent.md` only when the existing project with implementation history has no wiki baseline
2. review the relevant `docs/wiki/` pages for the task at hand once the relevant wiki pages exist
3. `review-instruction-coverage.agent.md` to assess `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` coverage
4. `create-instructions.prompt.md` for any uncovered language, framework, folder, file type, or workflow areas
5. `create-requirements.agent.md` if the work package requirements do not already exist
6. `create-technical-spec.agent.md` if the technical specification does not already exist
7. `create-delivery-plan.agent.md` if no delivery plan exists
8. `execute-delivery-plan.agent.md`, which includes any required wiki updates within execution
9. optional test and refactoring review loops, each with wiki review before work and wiki refresh handled within the relevant execution agent

### Pattern C: Existing package that mainly needs quality hardening

Use this pattern when the package already exists and mainly needs test hardening, refactoring, or other maintainability improvements. If the project already has relevant wiki pages, start by reviewing them. If the project is an existing project with implementation history but no wiki baseline, create that baseline first and then continue with the quality-hardening workflow.

Use:

1. `create-wiki.agent.md` only when the existing project with implementation history has no wiki baseline
2. review the relevant `docs/wiki/` pages for the task at hand once the relevant wiki pages exist
3. `review-instruction-coverage.agent.md` to assess `.github/copilot-instructions.md` and `.github/instructions/*.instructions.md` coverage
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
2. review `AGENTS.md` for repository operating expectations and `lessons.md` for stable implementation and maintenance learnings
3. `review-instruction-coverage.agent.md` when you need an evidence-based report of instruction coverage gaps against the wiki baseline
4. `create-instructions.prompt.md` to add any approved missing scoped instruction files
5. update `AGENTS.md` or `lessons.md` when the work reveals a stable repository-wide rule or lesson
6. refresh the affected `docs/wiki/` pages after the instruction set changes

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
