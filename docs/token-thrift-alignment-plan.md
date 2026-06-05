# Token-thrift alignment plan

This plan describes how to bring the repository's existing agents, instructions, prompts, templates, and supporting documentation into line with a token-thrift operating model. The goal is to reduce unnecessary token use, tighten execution discipline, and encode the approach into reusable assets so downstream teams inherit it by default rather than by folklore.

## Objectives

- Align reusable repository artifacts with the token-thrift principles without weakening quality, safety, or traceability.
- Push the lean behavior into templates and shared guidance first so future assets are correct by construction.
- Update workflow documentation so contributors understand where the stricter style applies and where it should be adapted.
- Add lightweight automation and repo-level reference files for repeatable validation and continuous learning.

## Current-state findings

- The repository already has a strong workflow model centred on wiki-first planning and staged delivery.
- Sample agents and prompts already use `gpt-5.4`, but they do not consistently encode token-thrift behaviors such as capped output, explicit search ordering, or bounded retry rules.
- Templates currently emphasize quality and wiki alignment, but they do not yet make token efficiency, narrow output shapes, or tool budgeting first-class requirements.
- The repository does not currently include `AGENTS.md` or `lessons.md`, both of which are required by the proposed approach for durable operating rules and learnings.
- `.github/skills/` exists as an empty folder, while `docs/wiki/skills-overview.md` still says the directory does not exist; that inconsistency should be corrected during documentation alignment.

## Scope and boundaries

This plan covers:

- reusable assets under `.github/agents/`, `.github/prompts/`, `.github/instructions/`, and `.github/templates/`
- repo-wide guidance in `.github/copilot-instructions.md`
- workflow and reference documentation under `docs/` and `docs/wiki/`
- new repeatable automation placed under an existing top-level folder, preferably `.github/scripts/`

This plan does not cover:

- retrofitting downstream repositories that consume this toolkit
- changing business-domain workflows unrelated to asset authoring and agent execution style
- broad rewrites of stable assets where a targeted update is sufficient

## Design principles for adaptation

The source rule set should be applied with repository-aware interpretation rather than copied blindly.

1. Preserve the repository's quality and wiki-first requirements.
2. Apply the stricter token-thrift rules most strongly to execution-oriented agents, review assets, and authoring prompts where wasted output is costly.
3. Keep user-facing teaching and explanatory assets concise, but do not force unnatural terseness where clarity is the primary value.
4. Prefer updating shared templates and shared instructions before touching every individual artifact.
5. Treat model tiering, search ordering, and retry limits as explicit policy, not informal convention.

## Target outcomes

When this plan is complete, the repository should provide:

- repo-level operating guidance that explains the token-thrift model and its intended use
- agent and prompt templates that default to lean execution patterns
- existing agents and prompts updated to use bounded questioning, search ordering, precise references, and explicit stop conditions
- documentation that explains the new operating style and how it fits with the existing staged workflow
- repeatable scripts for inventory, validation, and drift checking
- a durable place to record stable lessons learned from operating the toolkit

## Workstreams

### Workstream 1: Establish shared governance artifacts

Create the repository-level reference files that the token-thrift approach expects.

#### Changes

- Create `AGENTS.md` at the repository root to define the default token-thrift operating policy for this toolkit.
- Create `lessons.md` at the repository root to capture stable, reusable learnings from asset maintenance and execution.
- Update `.github/copilot-instructions.md` to reference these files as supporting governance artifacts where appropriate.

#### Notes

- `AGENTS.md` should explain how token-thrift rules interact with this repository's existing wiki-first and quality-first guidance.
- `lessons.md` should be concise, append-only in spirit, and focused on stable patterns rather than task logs.

#### Acceptance criteria

- Both files exist with clear purpose, ownership expectations, and update rules.
- Repo-wide guidance points contributors to them when stable practices or learnings emerge.

### Workstream 2: Add scoped instructions for lean asset authoring

Introduce or extend instructions so token-thrift behaviors apply automatically when contributors modify assets in this repository.

#### Changes

- Add a new scoped instructions file for `.github/agents/**/*.agent.md`, `.github/prompts/**/*.prompt.md`, and optionally `.github/templates/**/*.template.md` to standardize:
	- single-task focus where appropriate
	- plan-first behavior for non-trivial workflows
	- capped tool output and line-range discipline
	- semantic or code-graph search before iterative grep where available
	- explicit retry ceilings and blocker escalation
	- diff-based edits over full rewrites
	- precise file references using `file:line` when referring to implementation evidence
- Extend `.github/instructions/prompts.instructions.md` if necessary so prompt authoring reflects the same lean constraints.
- Review whether some rules belong in `.github/copilot-instructions.md` versus a new dedicated instructions file to avoid duplicating guidance.

#### Notes

- Avoid applying the rules globally to all Markdown files; scope them to Copilot assets and templates so the repository does not over-constrain unrelated documentation.
- Treat "no preambles or summaries" as a workflow-specific preference for execution-oriented assets, not a blanket rule for all human-facing content.

#### Acceptance criteria

- Relevant asset files automatically pick up token-thrift authoring rules through scoped instructions.
- The new instruction set is additive and does not conflict with existing repo-wide guidance.

### Workstream 3: Update shared templates first

Change the templates that generate future assets so new agents, prompts, and plans inherit the lean style by default.

#### Target files

- `.github/templates/agent.template.md`
- `.github/templates/prompt.template.md`
- `.github/templates/instructions.template.md`
- `.github/templates/delivery-plan.template.md`
- review and mitigation plan templates where output verbosity and evidence style matter

#### Changes

- Add explicit sections or constraints for:
	- output minimization and exact output shapes
	- one-question-at-a-time clarification when clarification is necessary
	- bounded retries with a stop-after-three-failures rule
	- capped tool output and deliberate line-range reads
	- explicit preference for scripts for repeatable work
	- preference for semantic search before text grep when suitable tools exist
	- precise evidence references using `file:line`
- Add guidance for model selection so templates can recommend cheaper models for routine workflows and reserve `gpt-5.4` for high-judgment tasks where justified.
- Ensure planning templates encourage targeted plans and discourage blind iteration.

#### Acceptance criteria

- New assets created from templates visibly inherit token-thrift behavior without requiring manual cleanup.
- Template changes remain compatible with the repository's wiki-review and documentation requirements.

### Workstream 4: Retrofit existing agents

Update the current agent library so each agent follows the leaner operating model in a way that matches its role.

#### Target files

- all files under `.github/agents/`

#### Changes

- Review each agent for:
	- whether it should enforce single-task scope within a session
	- whether its workflow should require an explicit plan before execution
	- whether it asks more questions than necessary
	- whether it encourages overlong intermediate drafts or summaries
	- whether it can specify preferred search order, output caps, and diff-only editing
	- whether it needs a documented blocker threshold after repeated failures
- Prioritize updates for:
	- `execute-delivery-plan.agent.md`
	- `execute-test-plan.agent.md`
	- `execute-refactoring-plan.agent.md`
	- `review-instruction-coverage.agent.md`
	- `create-delivery-plan.agent.md`
- Reassess model declarations per agent and down-tier routine authoring or review workflows where a cheaper model is sufficient.

#### Notes

- Not every agent needs the same strictness. For example, document-creation agents may still need brief framing and evolving drafts, while execution agents should be more tightly bounded.
- Preserve one-question-at-a-time behavior where it supports quality; the token-thrift goal is fewer wasted turns, not silence at the cost of correctness.

#### Acceptance criteria

- Every existing agent has been reviewed against the token-thrift checklist.
- High-impact agents explicitly encode lean search, tool, retry, and editing behavior.
- Model selection is intentional and documented.

### Workstream 5: Retrofit existing prompts

Update prompt files so they steer the model toward lean operation and avoid avoidable verbosity.

#### Target files

- all files under `.github/prompts/`

#### Changes

- Tighten prompt constraints to require:
	- concise outputs by default
	- exact output formats with minimal wrapper text
	- single-question clarification loops where needed
	- evidence-first reasoning with `file:line` references for code discussions
	- bounded research and explicit statement when no external sources are used
- Review whether prompt front matter should include model changes or remain on `gpt-5.4` pending validation.
- Ensure authoring prompts tell contributors to prefer extending existing assets rather than creating near-duplicates.

#### Acceptance criteria

- Prompt outputs become more deterministic and less chatty.
- Prompt instructions remain compatible with the repository's reusable Microsoft-project positioning.

### Workstream 6: Add repeatable automation

Introduce scripts so repeatable validation and inventory work does not rely on manual chat steps.

#### Proposed location

- `.github/scripts/`

#### Candidate scripts

- asset inventory script that lists agents, prompts, instructions, templates, and skills status
- drift-check script that verifies required sections, front matter fields, and selected token-thrift constraints across asset files
- documentation consistency script that spots obvious mismatches between wiki claims and repository structure, such as the current skills-folder statement
- optional report-generation script for producing compact audit summaries

#### Acceptance criteria

- Repeatable checks can be run without manually re-performing the same investigation in chat.
- Script output is concise and structured so it supports token-thrift review rather than defeating it.

### Workstream 7: Refresh wiki and repository documentation

Update the human-readable documentation so contributors understand the new approach and how to use it safely.

#### Target files

- `docs/wiki/workflow-overview.md`
- `docs/wiki/index.md`
- `docs/wiki/agents-overview.md`
- `docs/wiki/prompts-overview.md`
- `docs/wiki/instructions-overview.md`
- `docs/wiki/templates-overview.md`
- `docs/wiki/skills-overview.md`
- `README.md` if it should surface the operating model to new contributors

#### Changes

- Explain the token-thrift adaptation as an efficiency layer over the existing workflow, not a replacement for the repository's staged delivery model.
- Document where the rules apply strictly and where contributors should adapt them for clarity.
- Correct the skills-directory statement in `docs/wiki/skills-overview.md`.
- Add links to `AGENTS.md` and `lessons.md` where they become part of normal contributor guidance.

#### Acceptance criteria

- Wiki pages remain the source of truth for repository workflow and now reflect the token-thrift operating model accurately.
- No documentation page contradicts the repository structure or updated asset conventions.

## Recommended delivery sequence

1. Create `AGENTS.md` and `lessons.md`.
2. Add or extend scoped instructions for token-thrift asset authoring.
3. Update shared templates.
4. Retrofit the highest-impact execution agents.
5. Retrofit the remaining agents and prompt files.
6. Add validation and drift-check scripts.
7. Refresh wiki and contributor-facing documentation.
8. Run a final audit and capture stable learnings in `lessons.md`.

## Validation strategy

### Review gates

- Confirm each updated asset still follows its existing file-format conventions.
- Confirm new instructions do not duplicate or conflict with existing guidance.
- Confirm template changes propagate the intended behavior clearly.
- Confirm documentation references and relative links resolve after updates.

### Functional checks

- Use a small sample task for at least one updated agent, one updated prompt, and one template-derived artifact to verify the lean behavior in practice.
- Check that prompts and agents now prefer targeted diffs, bounded reads, and narrower outputs.
- Check that documentation and scripts agree on the repository inventory.

### Quality checks

- Ensure token-thrift changes do not remove necessary validation, traceability, or wiki refresh requirements.
- Ensure the approach remains reusable across Microsoft project contexts rather than becoming overfit to one workflow.

## Risks and mitigations

### Risk: over-correcting into unhelpful terseness

Mitigation: scope the strictest rules to execution and review workflows, and keep explanatory assets concise but still human-friendly.

### Risk: duplicated guidance across instructions, templates, and docs

Mitigation: define the policy once in shared governance artifacts and scoped instructions, then reference it from templates and docs.

### Risk: model tiering reduces quality for nuanced authoring tasks

Mitigation: pilot tiering on a small subset of routine assets first and keep `gpt-5.4` for high-judgment workflows until evidence supports broader down-tiering.

### Risk: scripts add maintenance overhead

Mitigation: create only the scripts that remove repeated manual investigation and keep each script narrowly focused.

## Definition of done

This alignment effort is complete when:

- shared governance files exist and are referenced appropriately
- token-thrift rules are encoded in scoped instructions and templates
- existing agents and prompts have been reviewed and updated where needed
- supporting scripts exist for repeatable validation and drift checking
- wiki and contributor documentation accurately describe the updated approach
- stable lessons from the rollout have been captured in `lessons.md`

## Suggested follow-up execution model

Implement this plan in a small number of reviewable pull requests rather than one large change set:

1. governance and instructions
2. templates and highest-impact agents
3. remaining prompts and agents
4. scripts and documentation refresh

That sequencing keeps the work reversible, makes review easier, and lets the shared scaffolding land before the long tail of asset updates.
