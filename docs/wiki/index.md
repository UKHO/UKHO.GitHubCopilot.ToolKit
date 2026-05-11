# Repository wiki

This wiki is the primary reference for the reusable GitHub Copilot assets in this repository. It explains how the repository is organized, how the asset types fit together, and where to start when creating or using agents, prompts, instructions, templates, and skills in Microsoft project workflows.

Within this repository, `docs/wiki/` documents the toolkit itself. By contrast, `create-wiki.agent.md` is a reusable asset for downstream repositories that want to generate their own project wiki baseline under `docs/wiki/`.

## Purpose and audience

This wiki is intended for contributors who need to:

- understand the repository's Copilot asset model
- choose the right asset type for a task
- follow the recommended end-to-end workflow
- reuse or extend the existing repository guidance safely

## Repository asset map

| Asset type | Primary location | Purpose |
| --- | --- | --- |
| Repository instructions | `.github/copilot-instructions.md` | Shared repo-wide guidance for reusable Microsoft project assets |
| Scoped instructions | `.github/instructions/` | File-type, workflow, stack, or folder-specific rules applied by context |
| Custom agents | `.github/agents/` | Reusable specialist agents for creation, review, planning, and execution workflows |
| Prompt files | `.github/prompts/` | Reusable prompt entry points for prompt, instruction, agent, and documentation authoring |
| Templates | `.github/templates/` | Reusable scaffolds that standardize new prompts, agents, instructions, plans, and documentation artifacts |
| Agent skills | `.github/skills/` | Task-specific skills that agents can auto-discover when present |
| Wiki | `docs/wiki/` | Human-readable reference documentation for the repository |

## Start here

- Read [Workflow overview](./workflow-overview.md) to understand the recommended delivery sequence.
- Read [Agents overview](./agents-overview.md) to understand the repository's custom agents and where they fit.
- Read [Prompts overview](./prompts-overview.md) to understand reusable prompt files and how to invoke them.
- Read [Instructions overview](./instructions-overview.md) to understand repo-wide and scoped Copilot instructions.
- Read [Templates overview](./templates-overview.md) to understand the reusable scaffolds used by prompts, agents, and documentation workflows.
- Read [Skills overview](./skills-overview.md) to understand how skills complement agents and the current repository status.

## Recommended usage model

This repository is designed around a staged documentation and delivery flow:

1. create or refresh the wiki baseline and use it as the project source of truth
2. define the business and systems context
3. define a work package and its technical specification
4. create a delivery plan
5. execute the plan while consulting the relevant wiki pages and refreshing them within execution when required
6. review testing quality and address gaps through execution steps that also refresh the wiki when required
7. review maintainability and address refactoring opportunities through execution steps that also refresh the wiki when required

The repository also includes utility prompts for authoring new prompts, agents, instructions, and broader documentation, while templates provide the repeatable structures those workflows fill in.

## Microsoft Learn alignment

The wiki is aligned with current Microsoft Learn guidance for:

- GitHub Copilot in Visual Studio
- custom instructions and prompt files
- agent mode and custom agents
- agent skills

Where repository behavior is specific to this repo, the wiki explains the repo convention separately from the product guidance.

## External references

- [Get started with GitHub Copilot in Visual Studio](https://learn.microsoft.com/visualstudio/ide/visual-studio-github-copilot-get-started?view=visualstudio)
- [Customize chat responses and set context](https://learn.microsoft.com/visualstudio/ide/copilot-chat-context?view=visualstudio)
- [Get started with GitHub Copilot agent mode](https://learn.microsoft.com/visualstudio/ide/copilot-agent-mode?view=visualstudio)
- [Use built-in and custom agents with GitHub Copilot](https://learn.microsoft.com/visualstudio/ide/copilot-specialized-agents?view=visualstudio)
- [Use Agent Skills with GitHub Copilot](https://learn.microsoft.com/visualstudio/ide/copilot-agent-skills?view=visualstudio)
