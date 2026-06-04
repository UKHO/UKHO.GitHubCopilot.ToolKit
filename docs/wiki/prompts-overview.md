# Prompts overview

This page explains the repository's reusable prompt files, how prompt files work in Visual Studio, and when to use a prompt instead of an agent.

## What a prompt file is

Microsoft Learn describes prompt files as reusable prompts stored in `.github/prompts/` with the `.prompt.md` extension. They let teams save, share, and rerun useful prompt patterns instead of rewriting them in chat.

In Visual Studio, prompt files can be:

- referenced with `#prompt:`
- added from the chat context picker
- invoked quickly from slash-command completion after typing `/`
- created from an existing conversation by using `/savePrompt`

## How prompt files fit in this repository

This repository uses prompt files mainly for reusable authoring workflows. They help contributors create or extend Copilot assets consistently, often by guiding users toward the repository templates that define the output structure.

In the recommended startup workflow, establish a wiki baseline before planning or delivery work. For existing projects with implementation history but no wiki baseline, run `create-wiki.agent.md`; for new projects, create or refresh the relevant wiki pages during delivery as the implementation takes shape. `create-instructions.prompt.md` is then used to close any instruction-coverage gaps the wiki reveals before delivery work proceeds.

Use a prompt file when:

- a person should intentionally invoke the workflow in chat
- the workflow is guidance-heavy rather than agent-persona-heavy
- the output is usually a new repository asset such as a prompt, agent, instruction file, or documentation set

Use an agent when the work is better expressed as a specialist agent-mode workflow.

## Repository prompt inventory

The repository currently contains four reusable prompt files.

| Prompt file | Mode | Purpose |
| --- | --- | --- |
| `create-copilot-agent.prompt.md` | `agent` | Interactive workflow that creates a new `.agent.md` file from the repository agent template |
| `create-copilot-prompt.prompt.md` | `agent` | Interactive workflow that creates a new `.prompt.md` file from the repository prompt template |
| `create-instructions.prompt.md` | `agent` | Interactive workflow that creates a new `.instructions.md` file from the repository instructions template |
| `review-pr-comments.prompt.md` | `ask` | Guidance workflow that reviews PR comments for a specific file, explains their likely intent and impact, and recommends a next action without making changes before user approval |

## Prompt files and templates

Prompt files are often the entry point, while templates provide the target structure.

- prompts guide the conversation and collect missing information
- templates define the reusable shape of the file being created
- together, they help contributors create consistent assets without inventing a new format each time

For the repository template layer, see [Templates overview](./templates-overview.md).

## Prompt design conventions used in this repo

The reusable prompt files in this repository follow these patterns:

- they use lower-case kebab-case file names
- they describe a single primary outcome
- they include structured sections such as purpose, inputs, constraints, process, and output format
- they prefer one-question-at-a-time authoring when the prompt is interactive
- they favor reusable Microsoft-project wording instead of repository-specific product assumptions
- when they guide planning or project updates, they direct contributors to consult the relevant wiki pages before acting and to refresh the wiki after changes

These conventions are reinforced by `.github/instructions/prompts.instructions.md`.

## How to use prompt files in Visual Studio

Microsoft Learn highlights the following usage model:

1. store reusable prompt files in `.github/prompts/`
2. reference them with `#prompt:` or add them as chat context
3. invoke them quickly from the `/` picker
4. save new reusable prompts from a conversation with `/savePrompt`

That model maps directly to this repository's prompt library.

## Prompt files versus custom instructions

Prompt files and instructions solve different problems:

- prompt files are **invoked intentionally** for a task
- instructions are **applied automatically** when the current context matches

If you need a reusable chat workflow, create or extend a prompt file. If you need always-on guidance for a file type, folder, or workflow, prefer a scoped instructions file.

## Prompt files versus agents

Prompt files and agents also differ:

- prompt files package a reusable prompt conversation entry point
- agents package a reusable specialist assistant definition for agent mode

When the workflow needs a persistent role, optional tool restrictions, or repeated agent-mode behavior, prefer an agent. When the workflow mainly needs reusable prompting logic, prefer a prompt file.

## Related pages

- [Agents overview](./agents-overview.md)
- [Instructions overview](./instructions-overview.md)
- [Templates overview](./templates-overview.md)
- [Workflow overview](./workflow-overview.md)

## External references

- [Customize chat responses and set context](https://learn.microsoft.com/visualstudio/ide/copilot-chat-context?view=visualstudio)
- [Get started with GitHub Copilot in Visual Studio](https://learn.microsoft.com/visualstudio/ide/visual-studio-github-copilot-get-started?view=visualstudio)
