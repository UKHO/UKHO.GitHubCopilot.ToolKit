# Skills overview

This page explains how agent skills relate to this repository, how skills differ from instructions and agents, and what the current repository status is.

## What a skill is

Microsoft Learn describes agent skills as reusable sets of task-specific instructions that agents can automatically discover and apply in agent mode. They capture focused operational knowledge, such as how to perform a build workflow, follow a team process, or apply a repeatable implementation pattern.

Skills complement other Copilot asset types:

- **instructions** set shared context and rules
- **agents** define a specialist persona and tool surface
- **skills** add focused task guidance that agents can discover automatically

## How skills work in Visual Studio

According to Microsoft Learn:

- workspace skills can be stored under `.github/skills/`
- each skill lives in its own folder
- each skill folder must contain a `SKILL.md` file
- `SKILL.md` contains YAML front matter plus Markdown instructions
- the agent decides when a skill is relevant and activates it automatically
- optional supporting resources can sit alongside `SKILL.md`

A typical skill structure looks like this:

```text
.github/
  skills/
    example-skill/
      SKILL.md
      references/
      scripts/
      assets/
```

## Key skill metadata

Microsoft Learn currently documents these important `SKILL.md` fields:

- `name`
- `description`
- optional metadata such as `license`, `compatibility`, `metadata`, and `allowed-tools`

The `description` is especially important because agents use it to judge when the skill is relevant.

## Skills versus instructions

Instructions are applied based on the file or task context that Copilot detects in chat. Skills are discovered and activated by agents during agent-mode workflows.

A simple rule of thumb is:

- use **instructions** for always-on repository or file-scope rules
- use **skills** for focused task procedures that an agent can invoke when needed

## Skills versus agents

Agents and skills are complementary, not competing:

- an **agent** defines the specialist role
- a **skill** teaches that agent how to perform a narrower class of tasks consistently

An agent can exist without repository skills. A skill can also be written so multiple agents can benefit from it.

## Current repository status

The repository currently does **not** contain a `.github/skills/` directory or any workspace skills.

That means:

- the repository already documents agents, prompts, and instructions
- the skill model is relevant for future extension
- contributors should understand the skill pattern before adding new task-specific reusable capabilities

## When a new skill would make sense here

A repository skill would make sense if a task is:

- narrow enough to describe as a repeatable procedure
- useful across multiple agents or repeated workflows
- better expressed as discoverable instructions than as another near-duplicate agent

Examples could include a future skill for work-package validation, report formatting, or repository-specific documentation synchronization.

## Guidance for future skill additions

If the repository adds skills later, keep them:

- under `.github/skills/`
- one skill per folder
- grounded in a specific reusable task
- complementary to the existing agent and instruction model
- documented in this wiki so contributors understand where they fit

## Related pages

- [Agents overview](./agents-overview.md)
- [Instructions overview](./instructions-overview.md)
- [Workflow overview](./workflow-overview.md)

## External references

- [Use Agent Skills with GitHub Copilot](https://learn.microsoft.com/visualstudio/ide/copilot-agent-skills?view=visualstudio)
- [Get started with GitHub Copilot agent mode](https://learn.microsoft.com/visualstudio/ide/copilot-agent-mode?view=visualstudio)
