---
description: 'Defines repo-wide Copilot guidance for reusable Microsoft project assets so instructions, prompts, and templates remain broadly applicable across repositories.'
applyTo: '**/*'
---

# Copilot Instructions

## Overview

These instructions standardize how Copilot-related assets are authored and maintained in this repository. They are intended for any change that touches instructions, prompts, templates, supporting documentation, or related repository guidance.

## Scope

Applies to: `**/*`

## General Guidelines

- Encourage established design and documentation principles such as clarity, separation of concerns, explicit dependencies, and reusable guidance.
- Prefer technology guidance that is applicable across Microsoft projects unless a file is explicitly scoped to a narrower stack or workflow.
- Keep repository assets adaptable so teams can reuse them in different Microsoft project contexts without inheriting assumptions from one specific solution.

## Instructions

### MUST

- Keep instructions, prompts, templates, and examples neutral enough to apply across Microsoft projects unless a file explicitly targets a narrower technology, framework, or workflow.
- Ground Microsoft-technology guidance in authoritative Microsoft documentation when practical, and periodically re-validate repository instruction files against those sources.
- Reuse and extend existing instructions, prompts, templates, and agents when they already cover the needed pattern closely enough, instead of creating near-duplicate repository assets.
- Use placeholders, examples, and workflow descriptions that describe patterns rather than repository-specific implementations.
- Keep documentation about repository workflows at the top level under `docs/` when the guidance is intended for reuse across multiple work packages or teams.
- Do not draft `docs/00x-work/` work packages unless explicitly requested.
- When generating review reports in this repository, create a new report file instead of updating the existing report so prior report history remains visible.

### SHOULD

- Prefer examples that use common Microsoft technologies only when they help illustrate a rule and do not narrow the guidance unnecessarily.
- Prefer reusable wording that can be adopted by teams building different kinds of Microsoft solutions, including services, libraries, web apps, automation, and documentation projects.
- Prefer scoped instruction files for technology-specific rules rather than embedding stack-specific assumptions in repo-wide guidance.
- Prefer evolving an existing shared asset when the change is additive and keeps the asset coherent.

### MUST NOT

- MUST NOT assume every Microsoft project uses the same runtime, UI framework, authentication provider, deployment target, or delivery workflow.
- MUST NOT hard-code repository-specific architecture choices, product names, or environment assumptions into shared assets unless the file is explicitly scoped to them.
- MUST NOT use examples that depend on one prior project’s domain language when neutral placeholders would communicate the rule just as well.
- MUST NOT create overlapping repository assets that restate the same guidance with only minor wording changes when an existing asset can be reused or extended.

## References (optional)

- `https://learn.microsoft.com/`

- `./.github/instructions/architecture.instructions.md`
- `./.github/instructions/auth.instructions.md`
- `./.github/instructions/configuration.instructions.md`
- `./.github/instructions/csharp.instructions.md`
- `./.github/instructions/docs.instructions.md`
- `./.github/instructions/dotnet-stack.instructions.md`
- `./.github/instructions/folders.instructions.md`
- `./.github/instructions/playwright.instructions.md`
- `./.github/instructions/tests.instructions.md`
- `./.github/instructions/work-packages.instructions.md`
