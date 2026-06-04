# Templates overview

This page explains how repository templates fit into the toolkit, what templates currently exist, and how they support consistent authoring across prompts, agents, instructions, and documentation workflows.

## What templates are

In this repository, templates are reusable starting points that standardize the structure of recurring artifacts. They are not a separate execution mechanism like agents or prompts. Instead, they provide the document and asset shape that prompts, agents, and contributors reuse when creating new files.

## Where templates live

Templates are stored under `.github/templates/`.

They support the repository's wider asset model by giving contributors a consistent scaffold for:

- project-level documentation
- work-package documentation
- review reports and mitigation plans
- Copilot instructions
- Copilot prompts
- Copilot agents

## How templates fit in the repository model

Templates sit underneath the authoring workflows described elsewhere in the wiki:

- **instructions** define always-on rules for how assets should be written or updated
- **prompts** provide reusable authoring entry points that often create new assets from templates
- **agents** provide specialist workflows that generate or update documents using repository templates
- **templates** provide the reusable file structure those prompts, agents, and contributors fill in
- **wiki pages** explain how the full model fits together and how contributors should use it

A simple way to think about the relationship is:

1. the wiki explains the workflow and asset model
2. instructions constrain how work should be done
3. prompts and agents drive the authoring workflow
4. templates provide the repeatable output structure

## Current template inventory

The repository currently includes these templates.

| Template file | Primary use | Typical output |
| --- | --- | --- |
| `agent.template.md` | Create new custom agents | `.github/agents/*.agent.md` |
| `prompt.template.md` | Create new prompt files | `.github/prompts/*.prompt.md` |
| `instructions.template.md` | Create new scoped instructions | `.github/instructions/*.instructions.md` |
| `business-requirements.template.md` | Draft project-level business requirements | `docs/business-requirements.md` |
| `systems-analysis.template.md` | Draft project-level systems analysis | `docs/systems-analysis.md` |
| `requirements.template.md` | Draft work-package requirements | `docs/00x-work/requirements.md` |
| `technical-spec.template.md` | Draft technical specifications | `docs/00x-work/technical-specification.md` |
| `delivery-plan.template.md` | Draft initial delivery plans | `docs/00x-work/plans/001-delivery-plan.md` |
| `test-review-report.template.md` | Draft test review reports | work-package review report files |
| `test-mitigation-plan.template.md` | Draft test mitigation plans | numbered test plan files |
| `refactoring-review-report.template.md` | Draft refactoring review reports | work-package review report files |
| `refactoring-mitigation-plan.template.md` | Draft refactoring mitigation plans | numbered refactoring plan files |

## How templates are used in practice

Templates are usually consumed in one of three ways:

1. a repository prompt guides a contributor through creating a new prompt, instruction, or agent from a matching template
2. a repository agent generates or updates planning and documentation artifacts using a matching template
3. a contributor uses the template directly when drafting a document in the repository workflow

Templates are therefore an enabling layer rather than a standalone workflow surface.

## Why the repository uses templates

Templates help the repository stay reusable across Microsoft projects by making common artifacts:

- easier to author consistently
- easier to review
- easier to extend without inventing new formats each time
- easier to align with the wiki-first workflow and instruction set

They also reduce near-duplicate asset creation because contributors can start from an established pattern instead of inventing a new structure from scratch.

## Relationship to the wiki-first workflow

Templates support the workflow after contributors have reviewed the relevant wiki pages.

For example:

- the wiki explains when to create business requirements, systems analysis, work-package requirements, technical specifications, and plans
- the matching templates define the expected structure of those artifacts
- the related prompts and agents use those templates to guide consistent authoring

In that sense, templates are part of the repository's implementation of the workflow rather than a separate workflow stage.

## Related pages

- [Repository wiki](./index.md)
- [Workflow overview](./workflow-overview.md)
- [Prompts overview](./prompts-overview.md)
- [Agents overview](./agents-overview.md)
- [Instructions overview](./instructions-overview.md)
