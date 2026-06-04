# Agents overview

This page explains how custom agents fit into the repository, how they relate to GitHub Copilot agent mode in Visual Studio, and which custom agents are currently provided.

## What an agent is

In Visual Studio, custom agents are reusable `.agent.md` files stored in `.github/agents/`. Microsoft Learn describes them as specialized agents that can define their own persona, instructions, model choice, and optional tool list for use in agent mode.

Each repository agent in this repo exists to support a repeatable documentation or delivery task rather than a one-off conversation.

## How agents fit into Visual Studio

According to Microsoft Learn:

- custom agents are stored in `.github/agents/`
- each agent file uses YAML front matter followed by Markdown instructions
- the front matter can include `name`, `description`, `model`, and `tools`
- custom agents work alongside built-in agents and can also benefit from MCP and agent skills

This repository uses custom agents as workflow assets for repository bootstrap, requirements, planning, review, and execution. Many of those agents rely on repository templates to keep their outputs consistent.

## Built-in agents versus repository agents

Visual Studio includes built-in agents such as `@debugger`, `@profiler`, `@test`, and `@modernize` for product-integrated IDE workflows. This repository does not replace them. Instead, it adds repository-specific agents for documentation-led delivery workflows that can be reused across Microsoft projects.

## Repository custom agent inventory

The repository currently contains 14 custom agents.

### Foundation agents

| Agent file | Primary output | Purpose |
| --- | --- | --- |
| `create-wiki.agent.md` | `docs/wiki/**/*.md` | Creates or refreshes the wiki baseline that grounds later Copilot-assisted workflow steps |
| `create-business-requirements.agent.md` | `docs/business-requirements.md` | Creates a project-level business requirements document through iterative clarification |
| `create-systems-analysis.agent.md` | `docs/systems-analysis.md` | Creates a project-level systems analysis document from business intent |

### Work-package definition agents

| Agent file | Primary output | Purpose |
| --- | --- | --- |
| `create-requirements.agent.md` | `docs/00x-work/requirements.md` | Creates or updates a work-package requirements document |
| `create-technical-spec.agent.md` | `docs/00x-work/technical-specification.md` | Creates a work-package technical specification |
| `create-delivery-plan.agent.md` | `docs/00x-work/plans/001-delivery-plan.md` | Creates a traceable incremental delivery plan |

### Execution agents

| Agent file | Primary output | Purpose |
| --- | --- | --- |
| `execute-delivery-plan.agent.md` | implemented work plus updated plan | Executes a numbered delivery plan with validation gates and any required wiki refresh |
| `execute-test-plan.agent.md` | strengthened tests plus updated plan | Executes a numbered test plan with validation gates and any required wiki refresh |
| `execute-refactoring-plan.agent.md` | refactored code plus updated plan | Executes a numbered refactoring plan with validation gates and any required wiki refresh |

### Review and mitigation agents

| Agent file | Primary output | Purpose |
| --- | --- | --- |
| `review-instruction-coverage.agent.md` | instruction coverage review report | Reviews the wiki against current instruction files and recommends where new scoped instructions should be created |
| `review-test-approach.agent.md` | test review report | Reviews a work package and its automated tests for coverage gaps and weak tests |
| `create-test-plan.agent.md` | numbered test plan | Creates a test plan from a test review report |
| `review-refactoring-approach.agent.md` | refactoring review report | Reviews a work package for maintainability and structure risks |
| `create-refactoring-plan.agent.md` | numbered refactoring plan | Creates a refactoring plan from a refactoring review report |

## How to choose the right repository agent

Use these selection rules:

- choose a **create** agent when you need a new artifact drafted from existing context
- choose an **execute** agent when you already have a numbered plan and want the work implemented in sequence
- choose a **review** agent when you need an independent assessment of instruction coverage, testing quality, or maintainability quality

## Agent design conventions used in this repo

The repository agent set follows these conventions:

- agents are named around a clear verb and target outcome
- outputs are usually Markdown documents under `docs/` or updates to an existing numbered plan
- workflow agents are meant to be reusable across Microsoft project types rather than tied to one product domain
- agents are staged so later agents can consume earlier artifacts
- workflow agents that plan, review, or execute work should consult the relevant `docs/wiki/` pages before acting
- execution agents treat required wiki refresh as part of execution rather than as a separate follow-on stage

## How agents relate to prompts and instructions

Agents are only one layer of the repository model:

- [Instructions overview](./instructions-overview.md) explains repo-wide and scoped rules that influence Copilot behavior
- [Prompts overview](./prompts-overview.md) explains reusable prompt files for authoring additional assets
- [Templates overview](./templates-overview.md) explains the reusable scaffolds that many authoring and documentation agents generate from
- [Skills overview](./skills-overview.md) explains task-specific skills that agents can discover when present

## External references

- [Use built-in and custom agents with GitHub Copilot](https://learn.microsoft.com/visualstudio/ide/copilot-specialized-agents?view=visualstudio)
- [Get started with GitHub Copilot agent mode](https://learn.microsoft.com/visualstudio/ide/copilot-agent-mode?view=visualstudio)
