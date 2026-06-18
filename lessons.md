# Repository lessons

This file captures stable lessons from maintaining the reusable Copilot assets in this repository. It is for durable learnings, not task-by-task notes.

## How to use this file

- Add short, reusable lessons that are likely to matter again.
- Prefer facts, patterns, and decision rules over narrative history.
- Update or remove entries if later evidence proves them incomplete or wrong.
- Keep transient planning notes out of this file.

## Stable lessons

- Keep `docs/wiki/` aligned with repository reality in the same change that alters workflow guidance, asset structure, or contributor expectations.
- Use lowercase model identifiers such as `gpt-5.4` in agent and prompt assets to match repository conventions.
- Check the real filesystem before documenting asset inventory; Git does not store empty directories, so a folder like `.github/skills/` will not exist in the repository until it contains a file.
- Put repository-wide operating policy in a small number of shared governance artifacts instead of copying the same rules into many near-duplicate files.
- Add small repeatable scripts for asset inventory, drift checks, and documentation consistency so reusable repository assets can be validated without repeating manual chat investigation.
