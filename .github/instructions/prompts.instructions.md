---
description: 'Standardizes how Copilot prompt files are named and described so prompt assets remain clear, brief, and easy to scan.'
applyTo: '.github/prompts/**/*.prompt.md'
---

# Copilot prompt naming rules

## Overview

These instructions define how to name and describe Copilot prompt files in this repository. They help contributors keep prompt assets brief, consistent, and easy to understand from the file name and front matter alone.

## Scope

Applies to: `.github/prompts/**/*.prompt.md`

- Applies when creating, renaming, or substantially restructuring prompt files under `./.github/prompts/`.
- Does not apply to non-prompt markdown files that do not use the `*.prompt.md` naming pattern.

## Instructions

### MUST

- Name prompt files using lowercase kebab-case.
- Name prompt files using the pattern `<verb>-<subject>[-<qualifier>].prompt.md`.
- Start prompt file names with a clear action verb that describes the primary task the prompt performs.
- Use a subject that identifies the main artifact, outcome, or target of the prompt.
- Keep the front matter `name` field aligned with the file name stem.
  - Example: `create-instructions.prompt.md` MUST use `name: create-instructions`.
- Ensure the file name, front matter `name`, and prompt purpose describe the same outcome.
- Keep prompt names brief enough to scan quickly while still distinguishing the prompt from nearby files.
- Use front matter `description` to state the prompt's intended outcome in one clear sentence.

### SHOULD

- Prefer prompt names with two to four terms before the `.prompt.md` suffix.
- Prefer a controlled verb set such as `create`, `update`, `review`, `analyse`, `generate`, `refactor`, `validate`, `summarise`, or `troubleshoot` when those verbs match the intended task.
- Add a qualifier only when it materially improves distinction.
  - Examples: `security`, `playwright`, `csharp`, `edge-cases`.
- Prefer folder structure to carry broad categorization so file names can stay focused on the prompt's specific purpose.
- Use the shortest subject wording that remains unambiguous within the prompts folder.

### MUST NOT

- MUST NOT use vague or generic file names that do not communicate the prompt's task.
- MUST NOT use filler terms such as `new`, `final`, `improved`, or `template` in the prompt file name unless they carry real distinguishing meaning.
- MUST NOT use multiple verbs in a way that makes the prompt's primary purpose ambiguous.
- MUST NOT let the front matter `name` field drift from the file name stem.
- MUST NOT add qualifiers when the folder path or subject already provides enough distinction.

## Output and Validation (optional)

- Expected artifacts: prompt files under `./.github/prompts/` with names that follow `<verb>-<subject>[-<qualifier>].prompt.md`.
- Validate success by checking that:
  - the file name is lowercase kebab-case
  - the file name starts with a verb and identifies a clear subject
  - the front matter `name` matches the file name stem
  - the front matter `description` states the prompt outcome clearly

## Examples (optional)

- Good: `create-instructions.prompt.md`
- Good: `review-refactoring-approach.prompt.md`
- Good: `create-copilot-prompt.prompt.md`
- Bad: `prompt1.prompt.md`
- Bad: `new-final-review.prompt.md`
- Bad: `do-stuff.prompt.md`

## Notes (optional)

- When a prompt inventory grows significantly, prefer using folders for broad grouping and keep file names focused on the prompt action and target.
