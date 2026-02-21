# v0.1 Scope Freeze

This document defines what is considered in-scope for `ex_asana` v0.1.

## In Scope

- Core HTTP client:
  - Bearer token auth
  - Structured errors
  - 429 retry with `Retry-After`
- Stream pagination:
  - `Asana.Tasks.list/3`
  - OpenAPI stream wrappers:
    - `Asana.Tasks.list_openapi/2`
    - `Asana.Projects.list_openapi/2`
    - `Asana.Users.list_openapi/2`
    - `Asana.Workspaces.list_openapi/1`
- Typed convenience wrappers with decoded structs:
  - Tasks:
    - `get/create/update/complete/reopen/delete`
    - `duplicate/duplicate_and_wait`
  - Projects:
    - `get/create/update/archive/unarchive/delete`
    - `duplicate/duplicate_and_wait`
    - `add/remove` members
    - `add/remove` followers
  - Users:
    - `get/update`
    - `get_for_workspace/update_for_workspace`
  - Workspaces:
    - `get/update`
    - `add_user/remove_user`
  - Attachments:
    - `upload/get/list/delete`
  - Jobs:
    - `get`
    - `wait_until_complete`
    - `wait_for_duplicate`
- Typed decode model:
  - `Asana.Task`, `Asana.Project`, `Asana.User`, `Asana.Workspace`
  - Unknown-field capture in `__info__`
- Webhook utility:
  - `Asana.Webhook.Signature` only

## Out of Scope

- Running webhook server/Plug receiver in this library
- Full convenience wrappers for every generated endpoint
- Non-core resources not listed above (portfolios, goals, audit logs, etc.)

## v0.1 Done Criteria

- `mix test` passes
- `mix ci.fast` passes
- `mix ci` passes (including dialyzer)
- README includes API surface and return-type matrix
- Release metadata and `CHANGELOG.md` are present
