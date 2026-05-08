---
description: 'Standardize the repository test approach (unit-first with xUnit, plus integration, end-to-end, and requirement-driven functional tests) so test projects are consistent, resilient, and CI-friendly.'
applyTo: 'test/**/*.cs, test/**/*.csproj'
---

# Test approach (unit, integration, E2E, functional)

## Overview

These instructions define how automated tests are structured and authored in this repository. Prefer fast, isolated unit tests. Add integration and end-to-end tests for cross-boundary behavior where needed. Add functional tests to validate documented requirements. The framework and suite-shape choices in this file are repository defaults unless a documented exception applies.

## Scope

Applies to: `test/**/*.cs, test/**/*.csproj`

- Applies when creating or updating any test projects or test code under `test/`.
- The framework and structure choices in this file are defaults for repository test work unless a narrower file or an explicitly documented exception applies.
- When a work item needs a justified deviation from these defaults, document the reason in the relevant project or work-package documentation so the deviation remains reviewable.
- These rules are additive to:
  - `/.github/instructions/folders.instructions.md`
  - `/.github/instructions/playwright.instructions.md`
  - `/.github/instructions/work-packages.instructions.md`

## Instructions

### MUST

- Keep all automated tests under `test/`.
- Use xUnit for unit test projects by default.
- All new non-trivial code MUST be covered with unit tests.
  - Where legacy code, generated code, boilerplate, or other constraints make unit testing impractical, any exclusion MUST be a conscious and reviewable team decision.
- Prefer unit tests over higher-level tests when a behavior can be validated without infrastructure.

- Standardize test project structure as: `test/<Service>/<Service>.<TestType>/...`
  - Use separate projects per test type so suites can be run independently:
    - `test/<Service>/<Service>.UnitTests`
    - `test/<Service>/<Service>.IntegrationTests`
    - `test/<Service>/<Service>.E2ETests`
    - `test/<Service>/<Service>.FunctionalTests`

- Use descriptive test file names that match the contained test class; avoid generic names like `UnitTest1.cs`.
- Automated test method names MUST follow the `MethodName_StateUnderTest_ExpectedResult` convention.
  - Prefer names that read as natural English, typically using `Should...` for the expected result and `When...` for the state under test.
  - Example: `CalculateTotal_ShouldReturnZero_WhenCartIsEmpty`
- Automated tests MUST be fully documented with comments immediately above each test method.
  - Test comments MUST capture requirement traceability when applicable, using identifiers from the relevant work package or requirement source (for example `FR1`, `NF2`, `SR3`, `TR1`).
  - Test comments MUST explain what the test is verifying, the expected outcome, and why the behavior matters or regression risk it is guarding against.
  - When the scenario is not obvious from the method name alone, test comments MUST also explain important setup assumptions or boundary conditions.
  - Prefer XML documentation comments (`///`) when the language and test framework support them cleanly.

- Keep test boundaries clear:
  - **Unit tests** MUST run in-process and in-memory.
    - Unit tests MUST NOT depend on real infrastructure (network, containers, databases, file system).
  - **Integration tests** MUST validate a single service boundary with real dependencies when needed.
    - If the test launches a composed application environment, it MUST treat the system as closed-box and interact through external boundaries.
  - **E2E tests** MUST validate cross-service or cross-boundary behavior through external interfaces.
    - E2E tests MUST treat the system as closed-box and avoid depending on in-process access to application internals.
  - **Functional tests** MUST validate documented requirements/acceptance criteria.
    - If a functional test is UI-driven, it MUST follow `/.github/instructions/playwright.instructions.md`.

- Ensure tests are deterministic and repeatable:
  - Tests MUST NOT depend on execution order.
  - Tests MUST avoid shared mutable state across test runs.
  - Tests that create external state MUST either clean up, or use unique identifiers to prevent cross-test pollution.

#### Requirement traceability (functional tests)

- Functional tests MUST be organized by the feature area, behavior, or surface they validate rather than by iterative work package identifier.
  - Prefer folders under the functional test project that describe the tested capability or surface area.
  - Functional test folders SHOULD use stable names that remain valid across multiple work packages.
  - Recommended structure:
    - `test/<Service>/<Service>.FunctionalTests/<feature-or-surface>/...`
    - Examples: `Authentication`, `Orders`, `OperatorNavigation`, `Configuration`

- Functional test method names MUST use the same `MethodName_StateUnderTest_ExpectedResult` convention as the rest of the suite.
  - Example: `RetryStatus_ShouldShowBlockedReason_WhenAuthenticationIsDegraded`
  - Functional test method names MUST NOT use numeric-only traceability names such as `<001>_<FR1>_point_of_test`

- Requirement traceability MUST remain explicit by referencing the requirement identifier from the work package requirements document (`docs/<00x-work>/requirements.md`) in the test method comments.
  - The comments SHOULD explain how the test scenario proves the requirement and why the requirement is important.
  - Example identifiers: `FR1`, `FR2`, ...

### SHOULD

- Keep the overall suite aligned to a testing pyramid:
  - Many unit tests
  - Fewer integration tests
  - Fewest E2E/functional tests
- Report on test coverage for the relevant codebase or test suite.
  - Maintain good coverage levels over time.
  - Justify meaningful reductions in coverage when they occur.

### MUST NOT

- MUST NOT mix unit tests and higher-level integration or E2E tests in the same test project.
- MUST NOT add time-based sleeps/waits as a primary flake mitigation strategy.

## Output and Validation (optional)

- Validate success:
  - `dotnet test`

## References (optional)

- `/.github/instructions/folders.instructions.md`
- `/.github/instructions/work-packages.instructions.md`
- `/.github/instructions/playwright.instructions.md`
- https://learn.microsoft.com/dotnet/core/testing/
- https://learn.microsoft.com/dotnet/core/testing/unit-testing-best-practices
