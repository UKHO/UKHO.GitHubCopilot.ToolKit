# Prompt and agent workflow guide

This document explains how the reusable prompts and agents in `./.github/` fit together as a delivery workflow for Microsoft projects.

## Primary workflow

Use this sequence when a project uses the work-package documentation flow described by this repository.

```text
Idea
  -> create-business-requirements agent
  -> create-systems-analysis agent
  -> create-requirements agent
  -> create-technical-spec agent
  -> create-delivery-plan agent
  -> execute-delivery-plan agent
  -> review-test-approach agent
  -> create-test-plan agent
  -> execute-test-plan agent
  -> review-refactoring-approach agent
  -> create-refactoring-plan agent
  -> execute-refactoring-plan agent
```

## Workflow stages

### 1. Project foundation

1. **`create-business-requirements.agent.md`**
   - Creates `./docs/business-requirements.md`.
   - Use first when a project or initiative starts from a business idea.
   - Produces the non-technical business baseline: goals, scope, stakeholders, and business requirements.

2. **`create-systems-analysis.agent.md`**
   - Creates `./docs/systems-analysis.md`.
   - Use after business requirements exist.
   - Refines business intent into system boundary, actors, use cases, business rules, system analysis requirements, quality attributes, and work-package candidates.

### 2. Work-package definition

3. **`create-requirements.agent.md`**
   - Creates a work-package `requirements.md` under `./docs/00x-work/`.
   - Use when you are turning one candidate package into a concrete unit of work.
   - Produces detailed `FRx`, `NFx`, and `SRx` requirements for that package.

4. **`create-technical-spec.agent.md`**
   - Creates `technical-specification.md` for the same work package.
   - Use after the work-package requirements are stable enough.
   - Produces the implementable technical design, traceability, testing strategy, configuration expectations, and solution structure.

5. **`create-delivery-plan.agent.md`**
   - Creates `plans/001-delivery-plan.md` for the work package.
   - Use after requirements and technical specification are in place.
   - Produces the incremental execution plan, validation gates, rollback guidance, and work-item ordering.

### 3. Delivery

6. **`execute-delivery-plan.agent.md`**
   - Executes the numbered delivery plan.
   - Use when the package is ready for implementation.
   - Implements the planned work in sequence, runs build and test gates, updates plan checkboxes, and aligns wiki documentation before completion.

### 4. Test review and mitigation loop

7. **`review-test-approach.agent.md`**
   - Reviews the completed or in-progress work package from a testing perspective.
   - Use after delivery when you want an independent view of test coverage quality.
   - Produces a numbered test review report identifying missing coverage, weak tests, and risk areas.

8. **`create-test-plan.agent.md`**
  - Creates a test plan from the test review report.
   - Use when the test review identifies meaningful gaps.
  - Produces a numbered plan with explicit work items, finding references, validation commands, and rollback guidance.

9. **`execute-test-plan.agent.md`**
  - Executes the test plan.
  - Use after the test plan is approved or ready to act on.
  - Strengthens tests, makes only minimal supporting code changes when required, validates the result, and updates the plan as work completes.

### 5. Refactoring review and mitigation loop

10. **`review-refactoring-approach.prompt.md`**
    - Reviews the completed or in-progress work package from a maintainability and structure perspective.
    - Use after delivery, or after test hardening, when you want an independent refactoring assessment.
    - Produces a numbered refactoring review report covering duplication, complexity, coupling, cohesion, and design risks.

11. **`create-refactoring-plan.agent.md`**
    - Creates a refactoring plan from the refactoring review report.
    - Use when the refactoring review identifies issues worth addressing.
    - Produces a numbered plan with prioritized refactoring work, safety boundaries, validation gates, and rollback guidance.

12. **`execute-refactoring-plan.agent.md`**
    - Executes the refactoring plan.
    - Use after the refactoring plan is ready for implementation.
    - Applies the planned refactors, preserves expected behavior, updates tests and docs where needed, and marks plan items complete only after validation.

## Supporting and utility prompts

These prompts are useful alongside the primary workflow, but they are not normally part of the main package-delivery sequence.

### Prompt and instruction authoring

- **`create-copilot-prompt.prompt.md`**
  - Creates a new reusable `*.prompt.md` file from the repository prompt template.
  - Use when you want to add another prompt to this reusable prompt collection.
  - Best used outside the normal product-delivery flow.

- **`create-instructions.prompt.md`**
  - Creates a new `*.instructions.md` file for repository-specific coding or documentation rules.
  - Use when you need a new scoped rule set for a language, framework, folder, file type, or workflow.
  - Best used before or alongside implementation work when standards need to be formalized.

### Repository documentation reconstruction

- **`create-documentation-suite.prompt.md`**
  - Reverse-engineers the repository into a full `/docs` documentation suite.
  - Use when the code exists but documentation is missing, stale, or incomplete.
  - This is an alternative documentation workflow, not a normal step in the work-package lifecycle.

## Recommended end-to-end usage patterns

### Pattern A: New feature or package from scratch

1. `create-business-requirements`
2. `create-systems-analysis`
3. `create-requirements`
4. `create-technical-spec`
5. `create-delivery-plan`
6. `execute-delivery-plan`
7. `review-test-approach`
8. `create-test-plan`
9. `execute-test-plan`
10. `review-refactoring-approach`
11. `create-refactoring-plan`
12. `execute-refactoring-plan`

### Pattern B: Existing package needs only delivery

1. `create-delivery-plan` if no delivery plan exists
2. `execute-delivery-plan`
3. optional review and mitigation loops

### Pattern C: Existing package needs quality hardening only

1. `review-test-approach`
2. `create-test-plan`
3. `execute-test-plan`
4. `review-refactoring-approach`
5. `create-refactoring-plan`
6. `execute-refactoring-plan`

### Pattern D: Repository standards tooling work

1. `create-instructions` when a new rule set is needed
2. `create-copilot-prompt` when a new reusable prompt is needed
3. `create-documentation-suite` when the repo documentation set needs to be reconstructed from code

## Workflow quick reference

| Workflow asset | Primary output | When to use | Typical predecessor | Typical successor |
| --- | --- | --- | --- | --- |
| `create-business-requirements.agent.md` | `docs/business-requirements.md` | Start project-level discovery | Idea | `create-systems-analysis` |
| `create-systems-analysis.agent.md` | `docs/systems-analysis.md` | Translate business intent into system analysis | `create-business-requirements` | `create-requirements` |
| `create-requirements.agent.md` | `docs/00x-work/requirements.md` | Define one work package | `create-systems-analysis` | `create-technical-spec` |
| `create-technical-spec.agent.md` | `docs/00x-work/technical-specification.md` | Define technical design for the package | `create-requirements` | `create-delivery-plan` |
| `create-delivery-plan.agent.md` | `docs/00x-work/plans/001-delivery-plan.md` | Create implementation plan | `create-technical-spec` | `execute-delivery-plan` |
| `execute-delivery-plan.agent.md` | Implemented code + updated plan | Deliver the package | `create-delivery-plan` | review agents |
| `review-test-approach.agent.md` | numbered test review report | Assess test quality | `execute-delivery-plan` | `create-test-plan` |
| `create-test-plan.agent.md` | numbered test plan | Turn test findings into work | `review-test-approach` | `execute-test-plan` |
| `execute-test-plan.agent.md` | hardened tests + updated plan | Implement test improvements | `create-test-plan` | refactoring review or completion |
| `review-refactoring-approach.agent.md` | numbered refactoring review report | Assess maintainability | `execute-delivery-plan` or `execute-test-plan` | `create-refactoring-plan` |
| `create-refactoring-plan.agent.md` | numbered refactoring plan | Turn refactoring findings into work | `review-refactoring-approach` | `execute-refactoring-plan` |
| `execute-refactoring-plan.agent.md` | refactored code + updated plan | Implement maintainability improvements | `create-refactoring-plan` | completion |
| `create-copilot-prompt.prompt.md` | new `*.prompt.md` file | Add a new reusable prompt | none | none |
| `create-instructions.prompt.md` | new `*.instructions.md` file | Add new scoped repo rules | none | none |
| `create-documentation-suite.prompt.md` | full `/docs` suite | Reconstruct docs from code | existing repo | docs review or maintenance |

## Practical guidance

- Use the **workflow agents** to create artifacts, execute validated plans, and review delivered work.
- Use the **utility prompts** only when you are maintaining the prompt library, repository instructions, or documentation estate itself.

In short: define the work, design the work, plan the work, execute the work, then review and harden the work.
