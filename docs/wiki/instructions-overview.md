# Instructions overview

This page explains how custom instructions are used in the repository, what instruction files currently exist, and how repo-wide and scoped instructions work together.

## What instructions are

Microsoft Learn describes custom instructions as reusable contextual guidance that Copilot can automatically attach to chat requests. They help Copilot align responses with team conventions, project structure, and workflow expectations.

Visual Studio supports two main instruction layers relevant to this repository:

- `.github/copilot-instructions.md` for repo-wide guidance
- `.github/instructions/*.instructions.md` for targeted guidance using `applyTo` globs

## How instructions work in Visual Studio

According to Microsoft Learn:

- scoped instruction files use the `.instructions.md` extension
- instruction files can include YAML front matter
- the `description` field is used for hover text in chat
- the `applyTo` field uses glob syntax to define where the instructions apply
- Copilot automatically detects the relevant instructions for the current context and lists them as references in the response

This repository uses that capability to keep guidance layered and reusable.

## Repository instruction layers

### Repo-wide guidance

`/.github/copilot-instructions.md` provides the shared baseline for the entire repository. It establishes expectations such as:

- keeping guidance reusable across Microsoft projects
- avoiding narrow product assumptions unless a file is explicitly scoped
- preferring extension of existing shared assets over near-duplicate files
- keeping reusable workflow documentation under `docs/`
- treating `docs/wiki/` as the project source of truth once the wiki baseline exists
- requiring planning and project-update workflows to consult relevant wiki pages before acting and refresh affected wiki pages after changes

### Scoped guidance

The `.github/instructions/` folder contains targeted instruction files for specific technologies, folders, or workflows.

## Repository scoped instruction inventory

| Instruction file | `applyTo` scope | Purpose |
| --- | --- | --- |
| `auth.instructions.md` | `src/**/AppHost/**/*, src/**/*AppHost*.csproj, src/**/*.cs, src/**/*.csproj, src/**/*.json` | Standards-based authentication guidance for Microsoft projects |
| `configuration.instructions.md` | `src/**/*.cs, src/**/*.csproj, src/**/*.json, src/**/*.razor, infra/**/*` | Configuration and secret handling guidance |
| `csharp.instructions.md` | `**/*.cs` | Core C# coding guidance |
| `docs.instructions.md` | `docs/**/*.md` | Markdown documentation structure and linking rules |
| `dotnet-stack.instructions.md` | `src/**/*.cs, src/**/*.csproj, src/**/*.sln, src/**/*.razor, src/**/*.json, infra/**/*` | Optional baseline .NET architecture guidance |
| `folders.instructions.md` | `**/*` | Folder placement and asset location rules |
| `playwright.instructions.md` | `test/**/*.cs, test/**/*.csproj` | Playwright .NET test guidance |
| `prompts.instructions.md` | `.github/prompts/**/*.prompt.md` | Prompt naming and description rules |
| `refactoring.instructions.md` | `src/**/*.cs, src/**/*.razor, src/**/*.razor.cs, test/**/*.cs` | Safe, behavior-preserving refactoring guidance |
| `tests.instructions.md` | `test/**/*.cs, test/**/*.csproj` | Repository-wide test approach guidance |
| `work-packages.instructions.md` | `docs/**/*.md` | Work-package documentation guidance |

## Why the repository uses multiple instruction files

A single instruction file is too coarse for a mixed repository. The layered model allows Copilot to:

- always respect the shared repo baseline
- apply only the relevant scoped rules for the current task
- avoid over-constraining unrelated files
- keep workflow and technology guidance modular

## Instruction authoring conventions used in this repo

The repository instruction files generally follow these conventions:

- one clear scope per file or workflow area
- Markdown structure with a single H1 and ordered headings
- MUST, SHOULD, and MUST NOT language for clarity
- neutral guidance that can be reused across Microsoft projects
- explicit `applyTo` scoping to avoid accidental global behavior

## When to add or extend an instruction file

Prefer extending an existing instruction file when the new guidance fits its current scope. Create a new scoped instructions file only when the new rules cover a genuinely distinct language, framework, file family, or workflow.

In the recommended workflow, this review happens immediately after the wiki baseline is created or refreshed. Contributors should compare the new wiki understanding against `.github/copilot-instructions.md` and the existing files under `.github/instructions/`, identify uncovered project areas, and then use `create-instructions.prompt.md` to add missing scoped guidance before continuing with work-package delivery. The same wiki pages should then be revisited before later planning or project-update tasks, and refreshed again after each change so the wiki remains current.

For guided authoring, use the repository's `create-instructions.prompt.md` prompt.

## Relationship to prompts, agents, and skills

- instructions provide always-on contextual rules
- prompts provide reusable, intentional chat workflows
- agents provide specialist agent-mode workflows
- templates provide reusable output scaffolds that prompts, agents, and contributors can fill in
- skills provide task-specific guidance discoverable by agents

## Related pages

- [Prompts overview](./prompts-overview.md)
- [Agents overview](./agents-overview.md)
- [Templates overview](./templates-overview.md)
- [Skills overview](./skills-overview.md)

## External references

- [Customize chat responses and set context](https://learn.microsoft.com/visualstudio/ide/copilot-chat-context?view=visualstudio)
- [Get started with GitHub Copilot in Visual Studio](https://learn.microsoft.com/visualstudio/ide/visual-studio-github-copilot-get-started?view=visualstudio)
