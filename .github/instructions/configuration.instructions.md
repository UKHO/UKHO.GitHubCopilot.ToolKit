---
description: 'Standardize operator-managed configuration and secret handling so settings remain centralized, protected, and safely editable through approved project workflows.'
applyTo: 'src/**/*.cs, src/**/*.csproj, src/**/*.json, src/**/*.razor, infra/**/*'
---

# Configuration management

## Overview

These instructions define how operator-managed configuration and secrets are handled in a Microsoft project. The goal is to keep runtime settings centralized, protect sensitive values, and ensure configuration changes flow through the intended project experience.

## Scope

Applies to: `src/**/*.cs, src/**/*.csproj, src/**/*.json, src/**/*.razor, infra/**/*`

- Applies when adding or changing configuration storage, configuration editing flows, secret handling, or admin or operator UI features.
- Applies to backend services, UI components, automation, and infrastructure that support operator-managed configuration.

## Instructions

### MUST

- Store operator-managed configuration in the project’s chosen authoritative configuration store.
- Keep third-party credentials and similar secrets securely protected at rest and in transit.
- Manage operator-facing configuration updates through the approved project experience when the repository exposes configuration management features.
- Use write-only secret handling for operator-managed secrets:
  - Operators MAY set or replace a secret.
  - Stored secret values MUST NOT be displayed back to the operator after save.
  - APIs and UI models MUST avoid returning populated secret values once persisted.
- Keep secrets and connection details out of source control.
- Use explicit application services or repositories for configuration persistence rather than scattering configuration writes across unrelated UI, endpoint, or automation code.

### SHOULD

- Separate secret metadata from secret material when it improves maintainability or auditing.
- Prefer audit-friendly configuration update flows so operational changes can be traced when the application supports it.
- Keep configuration editing experiences focused on changing current settings without exposing existing secret values.

### MUST NOT

- MUST NOT render existing secret values in UI forms, API responses, logs, exceptions, or diagnostics.
- MUST NOT store plaintext secrets in source control or sample configuration files.
- MUST NOT bypass the approved configuration workflow with ad hoc operator-only processes unless an explicit requirement justifies it.

## Output and Validation (optional)

- Validate success:
  - Verify operator configuration flows can update settings without revealing persisted secret values

## References (optional)

- `/.github/instructions/auth.instructions.md`
