# Changelog

All notable changes to this project will be documented in this file.

## [0.1.0] - 2026-02-21

### Added

- Core HTTP client with bearer auth, structured errors, and 429 `Retry-After` retry support.
- Stream pagination helpers and stream wrappers for tasks/projects/users/workspaces.
- Convenience wrappers for common task, project, user, workspace, and job workflows.
- OpenAPI generation pipeline with `allOf` flattening for schema completeness.
- Typed decoding for `Asana.Task`, `Asana.Project`, `Asana.User`, and `Asana.Workspace`.
- Unknown field preservation via `__info__` for forward compatibility.
- Webhook signature verification helper (`Asana.Webhook.Signature`).

