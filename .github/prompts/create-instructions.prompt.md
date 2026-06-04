---
agent: 'agent'
description: 'Create a new *.instructions.md file that matches this repo\'s conventions (front matter, applyTo scoping, kebab-case naming) and produces clear, enforceable rules.'
name: create-instructions
model: 'gpt-5.4'
# tools: ['search', 'microsoft.docs.mcp']
# tags: [copilot, instructions, repo-standards]
---

# Create a new Copilot instructions file (`*.instructions.md`)

## Purpose

Generate a new `*.instructions.md` file for this repository that:

- Uses correct markdown front matter
- Scopes rules via `applyTo`
- Presents actionable guidance in the same style as existing files under `./.github/instructions/`

## When to use

- You need a new reusable set of rules for a specific language, framework, folder, or file type.
- You want to standardize patterns (testing, naming, architecture, error handling, docs) for a subset of the repo.
- You have completed the wiki baseline for a project and identified languages, frameworks, folders, file types, or workflows that are not yet covered by existing Copilot instruction files.

## Inputs

### Required

- **File name** (kebab-case, lowercase) ending in `.instructions.md`
  - Example: `python-fastapi.instructions.md`
- **Front matter `description`**
  - One sentence
  - MUST be non-empty
- **Front matter `applyTo`**
  - One or more globs for which files these instructions apply to
  - For multiple globs, use the comma-separated format: `'**/*.js, **/*.ts'`
- **Instruction content goals**
  - Bullet list of the behaviors to enforce (what to do / avoid)

### Optional

- The primary audience (contributors, maintainers, students)
- Existing package/tooling preferences (linters, formatters, build tools)
- Links to repo docs the rules should align with

## Configuration variables (optional)

${RESEARCH_MODE="auto"} <!-- auto | always | never: controls whether to run a docs research phase when applicable -->

## Constraints

### Core behavior

- MUST: Accept the user's initial idea as input.
- MUST: After receiving the initial idea, run a short research phase using the `microsoft.docs.mcp` server when it improves correctness for Microsoft/.NET/Azure/GitHub/Copilot-related topics.
- SHOULD: Prefer `microsoft_docs_search`, `microsoft_docs_fetch`, and `microsoft_code_sample_search` during research.
- MUST: Apply research selectively (only when it improves correctness).
- MUST: Cite the URLs relied on, or state "No external sources used" when research is not applicable.
- MUST: Infer as much as possible from the user's initial idea and subsequent answers.
- MUST: Review the relevant `docs/wiki/` pages before drafting instructions that govern planning workflows, project updates, implementation standards, or repository workflow behavior.
- MUST: Inspect the existing instruction files and prefer extending or referencing an existing scoped instruction when that avoids creating a near-duplicate rule set.
- MUST: Ask clarifying questions until there is enough detail to output a high-quality instructions file.
- MUST: Ask only one question at a time.
- MUST: For each question, provide numbered suggested answers and include `Other: <free text>`.
- MUST: Produce a final `*.instructions.md` that follows the template structure and front matter guidance in `.github/templates/instructions.template.md`.
- MUST: When the instruction file governs planning workflows or project updates, require contributors to consult the relevant `docs/wiki/` pages before acting and to refresh the affected wiki pages after later implementation or system changes so the wiki remains the source of truth.
- MUST: When the generated instruction file can govern code-changing workflows that require wiki updates, require contributors to create the wiki baseline under `./docs/wiki/` first if it does not exist when the update is needed.
- MUST: When the instruction file defines repository coding, stack, or test standards, distinguish repository defaults from absolute mandates and describe how justified deviations should be documented when appropriate.

### Repo conventions

- MUST: Output exactly one markdown file's content.
- MUST: The file MUST be an '.instructions.md' file.
- MUST: Include markdown front matter.
- MUST: Front matter includes:
  - `description` (non-empty)
  - `applyTo` (glob or comma-separated globs in a single quoted string)
- MUST: Use a lowercase kebab-case file name.
- MUST: The body uses clear headings and bullet lists.
- MUST: Prefer patterns consistent with existing `./.github/instructions/*.instructions.md` files.
- MUST NOT: Include unrelated rules outside the declared scope.
- MUST NOT: Use vague guidance ("do it properly", "use best practices") without measurable criteria.
- MUST NOT: Present repository default standards as absolute mandates unless the constraint is genuinely mandatory for the scoped files or workflow.
- MUST NOT: Create a new instructions file that substantially duplicates an existing repository instruction when the guidance can be reused, referenced, or extended coherently.
- SHOULD: Use MUST / SHOULD / MUST NOT phrasing for determinism.
- Output MUST be: a single markdown document containing exactly one `*.instructions.md` file's content.

## Process

1. Extract what you can from the initial idea.
2. Research (if applicable) using `microsoft.docs.mcp` to improve correctness.
3. Review the relevant `docs/wiki/` pages when the instruction scope affects planning workflows, project updates, implementation standards, or repository workflow behavior, and ensure any wiki refresh it requires happens after the relevant implementation or system change.
4. Inspect the current repository instruction coverage and prefer extending existing scoped instructions when that is sufficient.
5. Ask one clarifying question at a time until all required input and template sections can be completed.
6. Keep an in-chat draft updated after every user answer.
7. Turn the collected information into enforceable MUST/SHOULD/MUST NOT rules.
8. Validate the final file against the Constraints.

### Start condition

When the user invokes this prompt, treat their first message as the **initial idea**. Do not request them to restate it.

### Question flow policy

- Do NOT use a prescribed or fixed question order.
- After each user answer, update the draft in-chat.
- The draft MUST be visible to the user after each question/answer turn.
- Perform the research phase only after the initial idea (and optionally again later if the user introduces a new Microsoft/.NET/Azure/Copilot-specific dependency or API).
- At each turn, decide the **single next question** by identifying the highest-impact missing or ambiguous information needed to complete the template.
- When you can confidently fill all template sections without guessing, stop asking questions and produce the final output.

### Drafting behavior

- Maintain a single evolving draft of the final `*.instructions.md`.
- In each turn after the initial idea, output in this exact order:
  1) **Draft (updated)**: the current draft `*.instructions.md` (even if incomplete)
  2) **Next question**: exactly one clarifying question with numbered suggested answers
- The **Next question** MUST appear after the draft so it is the last item in the message.

### How to choose the next question (adaptive)

At each turn:

1. Extract what's already known from the user's initial idea and prior answers.
2. Identify gaps relative to the template sections and front matter in `.github/templates/instructions.template.md`.
3. Walk the template from top to bottom. For the first section that is missing or ambiguous, ask one question to resolve it.
4. Ask **one** question that resolves the first unresolved section you encounter.

### Completion checklist

Before producing the final `*.instructions.md`, ensure:

- Front matter includes `description` (non-empty, single sentence) and `applyTo` (glob or comma-separated globs in one quoted string).
- The file name is lowercase kebab-case and ends with `.instructions.md`.
- Scope matches `applyTo` and does not introduce unrelated rules.
- Rules are measurable and written as MUST / SHOULD / MUST NOT.

## Output format

Return the new instruction file as a single markdown document, using the shared template as the required scaffold:

- Template to follow: `.github/templates/instructions.template.md`
- Replace all placeholders (including front matter fields) with concrete values.

```markdown
---
description: '<one sentence>'
applyTo: '**/*'
---

# <Instructions title>

## Purpose

## Scope

## Instructions

## Output and Validation (optional)
```

## Examples (optional)

### Example request

Create instructions for `src/MyService/**/*.cs` to enforce async/await and structured logging.

### Example response (optional)

A complete `*.instructions.md` file following `.github/templates/instructions.template.md`.
