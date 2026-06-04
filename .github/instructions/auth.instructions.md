---
description: 'Provide authentication guidance for Microsoft projects that need standards-based identity integration across local, test, and cloud environments.'
applyTo: 'src/**/AppHost/**/*, src/**/*AppHost*.csproj, src/**/*.cs, src/**/*.csproj, src/**/*.json'
---

# Standards-based authentication guidance

## Overview

These instructions standardize how authentication guidance should be written and implemented for Microsoft projects. Application code should focus on standards-based integration such as OpenID Connect (OIDC) and OAuth 2.0 so that identity-provider choices can vary by environment while remaining compatible with Microsoft-hosted solutions.

## Scope

Applies to: `src/**/AppHost/**/*, src/**/*AppHost*.csproj, src/**/*.cs, src/**/*.csproj, src/**/*.json`

- Applies when adding or changing authentication for APIs, web apps, services, or local orchestration.
- This is additive to more specific stack instructions when those files exist.

## Instructions

### MUST

- Keep identity-provider selection environment-driven.
  - Document which provider is used in each environment when that choice matters.
  - Prefer configuration-based selection so application code does not need environment-specific branching for provider swaps.

- For Azure-hosted Microsoft solutions, prefer Microsoft Entra ID when it satisfies the project requirements.
  - When integrating ASP.NET Core apps or APIs with Entra ID, prefer supported Microsoft libraries such as `Microsoft.Identity.Web` where appropriate.

- Prefer standards-based integration in application code:
  - Web apps MUST use OIDC Authorization Code flow (with PKCE where applicable).
  - APIs MUST validate access tokens using OAuth 2.0 / JWT bearer authentication.

- Keep identity configuration externalized.
  - Authority/issuer URLs, tenant/realm, client IDs, and secrets MUST NOT be hard-coded.
  - Secrets MUST NOT be checked into source control.

- When a non-production identity provider is used for local development or isolated testing, keep that choice explicit in configuration and documentation.
  - If the repository uses container orchestration or other managed local infrastructure for identity, manage the provider through that setup rather than undocumented manual steps.
  - Keep local identity setup repeatable so developers can recreate realms, tenants, applications, or client registrations consistently.

- Keep HTTPS metadata validation enabled outside Development.
  - `RequireHttpsMetadata` MAY be disabled only in Development for local-only identity flows.
  - In non-Development environments, the authority metadata endpoint MUST be HTTPS.

### SHOULD

- Prefer OIDC or OAuth in application code even when SAML 2.0 interoperability is required.
  - If a partner or external system requires SAML 2.0, prefer handling SAML at the identity-provider boundary and exposing OIDC or OAuth 2.0 to the application when possible.

- Keep tokens and cookies scoped correctly per app.
  - Validate audience for APIs.
  - Use least-privilege scopes.

### MUST NOT

- MUST NOT hard-code a single identity provider as a repository-wide requirement unless the repository explicitly adopts that standard.
- MUST NOT implement time-based waits to “fix” auth readiness; rely on application health and readiness patterns instead.
- MUST NOT disable HTTPS metadata validation outside Development.
- MUST NOT add direct SAML protocol handling to applications unless there is a concrete requirement and no viable IdP-level brokering approach.

## Output and Validation (optional)

- Expected artifacts vary by project and may include environment-specific identity configuration, application authentication wiring, and operator or developer guidance.

- Validate success:
  - Complete an authenticated user flow in the relevant environment.
  - Run the applicable automated tests.

## References (optional)

- https://learn.microsoft.com/entra/msal/dotnet/microsoft-identity-web/
- https://learn.microsoft.com/aspnet/core/security/authentication/azure-active-directory/?view=aspnetcore-10.0
- https://learn.microsoft.com/aspnet/core/security/authentication/configure-oidc-web-authentication?view=aspnetcore-10.0
