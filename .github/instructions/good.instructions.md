---
description: 'Defines aspirational solution-quality guidance so contributors move technical solutions to business problems toward resilient, secure, operable, maintainable, and well-documented outcomes.'
applyTo: '**/*'
---

# Good solution characteristics

## Overview

These instructions describe what a good technical solution to a business problem should look like and move toward over time. In this file, solution means the whole technical response being delivered, from a small application or automation through to a distributed application. It does not mean a Microsoft or Visual Studio solution, nor does it mean an individual project file.

These instructions are for contributors creating or changing code, tests, infrastructure, documentation, prompts, agents, templates, or planning assets in repositories that support those technical solutions.

A good solution may not satisfy every characteristic immediately. Contributors should still consider these characteristics during each change, make proportionate improvements where practical, and document justified tradeoffs when constraints prevent full alignment.

A good solution should normally be cloneable and runnable by a new contributor with no local configuration or only a small, documented setup step. The solution should contain the resources needed to run the application locally, with suitable mocks, fakes, seeded data, or local containers for external systems where necessary. It should also let contributors run most, and ideally all, automated tests on a desktop with little effort.

It should run on current, supported platform versions where practical, such as supported .NET, C#, SQL Server, database drivers, JavaScript runtimes, operating systems, and cloud SDKs.

It should follow a cloud-first approach and strongly consider containers when they improve portability, deployment consistency, local development, or operational reliability.

It should be strongly cohesive and loosely coupled so responsibilities are clear, dependencies are intentional, and change remains localized.

## Scope

Applies to: `**/*`

- Applies when creating or changing the technical solution structure, implementation, tests, infrastructure, documentation, repository guidance, or delivery workflow assets.
- Complements more specific scoped instruction files; when instructions conflict, prefer the more specific file for the affected language, framework, folder, or workflow.
- Treats these rules as solution-quality direction rather than a claim that every prompt or task can fully achieve every characteristic in one change.

## Instructions

### MUST

- Consider reliability, security, cost, operational excellence, and performance when making architecture, delivery, or operational decisions.
- Keep business goals, user outcomes, system boundaries, major tradeoffs, and quality attributes traceable through technical solution documentation.
- Treat `./docs/wiki/` as the solution source of truth by reviewing it before solution-changing work and refreshing affected pages after changes.
- Apply the organization’s cloud-first policy when making hosting, architecture, operational, deployment, data, integration, and tooling decisions.
- Make security a lifecycle concern, including identity, authorization, secret handling, dependency risk, and secure deployment.
- Provide a documented local startup path, required local resources, and safe defaults so contributors can run the solution with minimal setup and no production secrets.
- Provide a documented local test path, separating tests that cannot reasonably run on a desktop and explaining why.
- Use current, supported platform and dependency versions where practical, keeping chosen versions explicit and reviewable.
- Assess container suitability where it affects architecture, operations, local development, testing, or deployment, and keep container assets secure and reproducible when used.
- Prefer small, reviewable, reversible changes that preserve existing behavior unless the task explicitly requires behavior change.
- Keep source code, tests, infrastructure, configuration, documentation, and delivery assets version controlled and reviewable.
- Ensure solutions have automated validation appropriate to their maturity.
- Keep configuration and secrets separated from source code.
- Document significant deviations from repository defaults, Microsoft guidance, or UKHO guidance.

### SHOULD

- Improve solution maturity incrementally rather than blocking useful work until every desirable solution characteristic is complete.
- Prefer clear separation of concerns and choices that are observable, testable, deployable, supportable, and understandable.
- Prefer strongly cohesive components with loose coupling between boundaries, services, modules, and integration points.
- Prefer automation for repeatable build, test, security, infrastructure, release, and documentation checks.
- Prefer simple documented local startup and test commands, with suitable local substitutes for external systems.
- Prefer deterministic, isolated tests that avoid production services, hidden credentials, shared mutable environments, or brittle ordering.
- Prefer cloud-native and managed capabilities where they reduce operational burden while satisfying security, cost, reliability, and compliance needs.
- Consider Microsoft Aspire as a technology choice for distributed systems that benefit from code-centric orchestration, service defaults, local containers, and observability.
- Prefer container-friendly designs and orchestration where they improve portability, repeatability, local development, deployment consistency, or operational reliability.
- Prefer infrastructure as code, controlled delivery practices, and actionable telemetry for supportable operations.
- Prefer explicit quality expectations for performance, availability, recovery, compliance, accessibility, cost, and operability where the solution context requires them.
- Prefer supported, necessary, actively maintained dependencies with visible upgrade paths.
- Prefer documentation that explains why important choices were made and keeps validation steps visible.
- Prefer human review for important AI-generated architecture, security, workflow, and implementation decisions.

### MUST NOT

- MUST NOT treat aspirational quality guidance as permission to introduce broad rewrites, new platforms, or large dependencies unrelated to the requested task.
- MUST NOT present solution defaults as absolute mandates when the repository, business context, or workload constraints justify a documented deviation.
- MUST NOT optimize one quality attribute by silently weakening security, reliability, maintainability, or operability.
- MUST NOT add secrets, credentials, private keys, tokens, or production connection strings to source control, examples, logs, prompts, or documentation.
- MUST NOT require undocumented manual setup, hidden machine state, production access, private resources, or secrets for normal local startup or desktop testing.
- MUST NOT hide checks exclusively behind CI when they can reasonably run on a developer desktop.
- MUST NOT start new solution work on out-of-support platforms or leave unsupported critical dependencies untracked without documented constraints.
- MUST NOT default away from cloud-first or reject suitable containers without a documented reason.
- MUST NOT create guidance that conflicts with current `./docs/wiki/` content without updating the affected wiki pages.
- MUST NOT duplicate rules already covered by a more specific instruction file when referencing or extending that file would keep the guidance coherent.
- MUST NOT leave critical operational assumptions, manual release steps, environment requirements, or support responsibilities undocumented.

## Output and Validation (optional)

- Expected outcome: each change moves the solution measurably toward documented, secure, tested, operable, maintainable, and supportable delivery.
- Validate success by checking that:
  - applicable scoped instruction files were followed
  - relevant `./docs/wiki/` pages were reviewed before the change
  - affected wiki pages were refreshed after solution-understanding changes
  - local startup and test paths are discoverable and practical for a new contributor
  - platform versions, cloud-first decisions, and container decisions are visible where they affect the solution
  - meaningful tradeoffs or deviations were documented
  - appropriate build, test, lint, security, or documentation checks were run or explicitly deferred with a reason

## References (optional)

- https://learn.microsoft.com/azure/well-architected/what-is-well-architected-framework
- https://learn.microsoft.com/devops/what-is-devops
- https://learn.microsoft.com/azure/security/develop/secure-dev-overview
- https://learn.microsoft.com/dotnet/core/releases-and-support
- https://learn.microsoft.com/sql/sql-server/end-of-support/sql-server-end-of-support-overview
- https://learn.microsoft.com/troubleshoot/sql/database-engine/install/windows/support-policy-sql-server
- https://learn.microsoft.com/azure/cloud-adoption-framework/overview
- https://learn.microsoft.com/azure/architecture/containers/container-get-started
- https://learn.microsoft.com/azure/container-apps/dotnet-overview
- https://aspire.dev/
- https://learn.microsoft.com/dotnet/aspire/get-started/aspire-overview
- https://github.com/UKHO/docs
- `./docs/wiki/index.md`
- `./docs/wiki/instructions-overview.md`
- `./docs/wiki/workflow-overview.md`
- `./.github/instructions/auth.instructions.md`
- `./.github/instructions/configuration.instructions.md`
- `./.github/instructions/docs.instructions.md`
- `./.github/instructions/dotnet-stack.instructions.md`
- `./.github/instructions/tests.instructions.md`
- `./.github/instructions/work-packages.instructions.md`

## Notes (optional)

- Good solution characteristics are directional. Apply them proportionately to the solution maturity, risk, business value, and scope of the current task.
