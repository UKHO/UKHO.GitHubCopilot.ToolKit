---
description: 'Provide optional baseline guidance for repositories that use the Microsoft .NET application stack.'
applyTo: 'src/**/*.cs, src/**/*.csproj, src/**/*.sln, src/**/*.razor, src/**/*.json, infra/**/*'
---

# Microsoft stack .NET architecture guidelines

## Overview

These instructions define baseline default technical choices and architectural expectations for repositories that use the Microsoft .NET stack. Apply this guidance only when the target project is actually using .NET application technologies covered by this file.

## Scope

Applies to: `src/**/*.cs, src/**/*.csproj, src/**/*.sln, src/**/*.razor, src/**/*.json, infra/**/*`

- Applies when creating new services, APIs, .NET web front ends, or distributed application wiring.
- Applies when selecting a database or local orchestration approach for a work item.
- The stack choices in this file are defaults for applicable .NET work, not absolute mandates for every project shape.
- When a work item needs a justified deviation from these defaults, document the reason in the relevant project or work-package documentation so the deviation remains reviewable.
- For project-specific UI component guidance, also follow any applicable scoped instruction files.

## Instructions

### MUST

- Use C# and the repository’s configured .NET SDK/runtime version (follow `global.json` if present; otherwise check Microsoft Learn to confirm the latest .NET LTS version and target it by default).
- Enable nullable reference types for new .NET projects (`<Nullable>enable</Nullable>`) and treat new nullable warnings as errors in touched projects when feasible.

- For new HTTP services, prefer Minimal APIs unless a concrete requirement needs an alternative.
- When exposing HTTP endpoints, provide OpenAPI output (for example via `Microsoft.AspNetCore.OpenApi`) and include health endpoints.
  - OpenAPI SHOULD be mapped only in the `Development` environment unless explicitly required.
  - Health endpoints SHOULD include separate readiness and liveness probes when the service has dependencies.

- For new .NET web UIs, prefer Blazor when it fits the project’s established technology direction.

- Prefer a Microsoft-aligned data platform choice when the project requires a relational data store.
- Use a migration-based schema workflow when the chosen persistence technology supports it.
- Keep all connection strings and credentials out of source control; use configuration + secret injection (development user-secrets; production secret store/managed identity where applicable).
- Follow `/.github/instructions/configuration.instructions.md` for operator-managed configuration storage and secret-handling flows.

- If the repository uses local orchestration for distributed application development, follow the established orchestration patterns in that repository.
  - Ensure the full distributed system can be started locally through the chosen orchestration entry point.

- When services are intended for containerized deployment, ensure they are containerizable using the repository’s standard publishing or container workflow.
  - Prefer configuration via environment variables and external configuration sources over hard-coded values.
  - For Azure-hosted deployments, prefer managed identity for accessing Azure resources instead of client secrets when supported.

- Design for scalability by default.
  - Prefer service-based boundaries over tightly coupled modules when adding new major capabilities.
  - When cross-service communication is needed, use an explicit contract and consider asynchronous messaging for decoupling.

### SHOULD

- Prefer pinning the SDK with `global.json` for repeatable local and CI builds, and keep it updated.
- Prefer .NET SDK container publishing (`dotnet publish` with `/t:PublishContainer`) for standard services unless a custom `Dockerfile` is required.

- Prefer Azure-native building blocks when introducing new Microsoft-cloud infrastructure:
  - Messaging: choose the Azure messaging service that matches the workload pattern.
    - Prefer Azure Service Bus for enterprise messaging that needs durable brokered delivery, ordering, duplicate detection, sessions, or transactions.
  - Identity: prefer managed identity for service-to-service and service-to-Azure authentication.

- When using messaging, design consumers/handlers to be idempotent and tolerant of duplicate deliveries.

- Use structured logging and distributed tracing for services (OpenTelemetry conventions if present in the repo).
- Use resilience patterns for cross-service calls (timeouts, retries with backoff, idempotency where applicable).

- Keep solution and project structure aligned with `/.github/instructions/folders.instructions.md`.
- For iterative work items, keep documentation aligned with `/.github/instructions/work-packages.instructions.md`.

### MUST NOT

- MUST NOT introduce non-Microsoft primary stacks for new product code without an explicit, documented reason.
- MUST NOT create new HTTP APIs using controller-based MVC by default when Minimal APIs are sufficient.
- MUST NOT embed secrets in `appsettings*.json`, source code, or Dockerfiles.
- MUST NOT couple services through shared databases as an integration mechanism without a documented reason and constraints.

## Output and Validation (optional)

- Expected artifacts (as applicable):
  - Minimal API service project(s) under `src/`
  - Blazor or other .NET web UI project(s) under `src/`
  - Persistence with migrations when applicable
  - Local orchestration wiring when distributed application startup is required
  - Container build or publish path when containerized deployment is required

- Validate success (as applicable):
  - `dotnet build`
  - `dotnet test`
  - Start the system locally through the chosen local entry point

## References (optional)

- `/.github/instructions/configuration.instructions.md`
- `/.github/instructions/folders.instructions.md`
- `/.github/instructions/work-packages.instructions.md`
- https://learn.microsoft.com/dotnet/core/releases-and-support
- https://learn.microsoft.com/dotnet/core/tools/global-json
- https://learn.microsoft.com/aspnet/core/fundamentals/openapi/overview
- https://learn.microsoft.com/aspnet/core/host-and-deploy/health-checks
- https://learn.microsoft.com/aspnet/core/security/app-secrets
- https://learn.microsoft.com/aspnet/core/security/key-vault-configuration
- https://learn.microsoft.com/dotnet/core/containers/sdk-publish
- https://learn.microsoft.com/azure/container-apps/dotnet-overview
- https://learn.microsoft.com/azure/container-apps/managed-identity
- https://learn.microsoft.com/azure/well-architected/service-guides/azure-service-bus
