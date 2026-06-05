# GitHub Copilot Enablement Toolkit

This repository provides practical assets to help software engineers get up and running with GitHub Copilot.

## Purpose

The goal of this project is to collect and organize reusable materials that make it easier to adopt GitHub Copilot in day-to-day engineering work. It is intended as a starting point for individuals and teams who want clear guidance, ready-to-use resources, and supporting documentation.

The repository presents one documentation-led approach to using GitHub Copilot on new or existing projects. Teams can adapt that approach to fit their own delivery model, tooling, governance, and engineering practices.

In the suggested workflow, establish a wiki baseline under [`docs/wiki/`](./docs/wiki/index.md) (create it first for existing projects that don’t already have one; for new projects, create or refresh the relevant pages as delivery work progresses) and then maintain it as the project source of truth. Copilot should consult the relevant wiki pages before planning or changing a project, and update the wiki again after changes that affect project understanding.

## Start here

- Read the [Repository wiki](./docs/wiki/index.md) for the top-level guide to the workflow and assets.
- Read the [Workflow overview](./docs/wiki/workflow-overview.md) for the recommended sequence.
- Read the [Prompts overview](./docs/wiki/prompts-overview.md), [Agents overview](./docs/wiki/agents-overview.md), [Instructions overview](./docs/wiki/instructions-overview.md), and [Skills overview](./docs/wiki/skills-overview.md) to understand how the asset types fit together.

## What this repository contains

- **Wiki documentation** under [`docs/wiki/`](./docs/wiki/index.md) that explains the repository model, the recommended workflow, and how the asset types fit together
- **Repository governance** in [`AGENTS.md`](./AGENTS.md) and [`lessons.md`](./lessons.md) for durable operating guidance and reusable learnings
- **Prompts** under [`.github/prompts/`](./.github/prompts/) for reusable authoring and workflow entry points
- **Instructions** under [`.github/instructions/`](./.github/instructions/) to guide consistent and effective Copilot usage
- **Agents** under [`.github/agents/`](./.github/agents/) that support specific planning, review, and execution scenarios
- **Templates** under [`.github/templates/`](./.github/templates/) for creating consistent repository assets and documentation artifacts
- **Validation scripts** under [`.github/scripts/`](./.github/scripts/) for repeatable inventory, drift, and documentation-consistency checks
- **Documentation** under [`docs/`](./docs/) to explain how to use the available tools and resources

## What the wiki covers

The wiki is the main guide to the approach captured in this repository. It includes:

- the [repository wiki landing page](./docs/wiki/index.md), which maps the available asset types and where they live
- the [workflow overview](./docs/wiki/workflow-overview.md), which describes the recommended wiki-first sequence for planning, delivery, testing, and refactoring
- the [prompts overview](./docs/wiki/prompts-overview.md), which explains when and how to use the reusable prompt files
- the [agents overview](./docs/wiki/agents-overview.md), which explains the specialist agents provided by the repository
- the [instructions overview](./docs/wiki/instructions-overview.md), which explains the repo-wide and scoped instruction model
- the [skills overview](./docs/wiki/skills-overview.md), which explains how skills relate to the rest of the asset model

Taken together, those pages explain both the repository's information model and the intended way to apply it during Copilot-assisted work.

## Suggested usage model

This repository's suggested approach is to:

1. create or refresh the [wiki baseline](./docs/wiki/index.md)
2. review the relevant [workflow](./docs/wiki/workflow-overview.md) and [instruction](./docs/wiki/instructions-overview.md) guidance
3. review [`AGENTS.md`](./AGENTS.md) and [`lessons.md`](./lessons.md) when creating or changing reusable repository assets
4. use the repository prompts, instructions, agents, templates, and validation scripts to plan and deliver work, with execution steps refreshing affected wiki pages when required

That approach is intentionally opinionated because it gives teams a repeatable starting point. It should be treated as a reusable pattern rather than the only way to use GitHub Copilot effectively.

## Who this is for

This repository is aimed at software engineers who want to:

- learn how to use GitHub Copilot effectively
- accelerate common development tasks
- standardize Copilot-assisted workflows where that is useful
- onboard quickly with practical examples and guidance

## Expected outcomes

Using the contents of this repository, engineers should be able to:

- understand the purpose of the provided prompts, instructions, agents, templates, and wiki guidance
- find reusable guidance for common development activities
- adopt GitHub Copilot more confidently in their workflow
- use supporting documentation to get productive faster
- keep the wiki current so planning, delivery, and documentation updates stay grounded in the same project context

## Repository direction

As the project grows, this repository can serve as a central place for:

- reusable wiki-first workflow guidance
- curated Copilot prompts
- team or project-specific instructions
- reusable agent definitions
- onboarding and reference documentation

## Contributing

Contributions that improve the prompts, instructions, agents, or documentation are welcome.