# ex_asana

Elixir client library for the Asana API with cursor pagination exposed as lazy streams.

## Quick start

```elixir
client = Asana.client(token: System.fetch_env!("ASANA_TOKEN"))

client
|> Asana.Tasks.list("120000000000001", opt_fields: ["gid", "name", "completed"])
|> Enum.take(10)
```

`Asana.Tasks.list/3` returns a stream and automatically follows `next_page.offset` as needed.

You can also use the generated operation modules through the stream wrapper:

```elixir
Asana.Tasks.list_openapi("120000000000001",
  token: System.fetch_env!("ASANA_TOKEN"),
  opt_fields: ["gid", "name", "completed"]
)
|> Enum.take(10)
```

Other generated stream wrappers follow the same shape:

```elixir
Asana.Projects.list_openapi("workspace_gid", token: token) |> Enum.take(10)
Asana.Users.list_openapi("workspace_gid", token: token) |> Enum.take(10)
Asana.Workspaces.list_openapi(token: token) |> Enum.take(10)
Asana.Attachments.list_openapi("task_gid", token: token) |> Enum.take(10)
```

## API Surface (v0.1)

| Module | Stream Wrappers | Convenience Wrappers | Return Type |
| --- | --- | --- | --- |
| `Asana.Tasks` | `list/3`, `list_openapi/2` | `get/create/update/complete/reopen/delete`, `duplicate/duplicate_and_wait` | `%Asana.Task{}` (except duplicate ops: job map) |
| `Asana.Projects` | `list_openapi/2` | `get/create/update/archive/unarchive/delete`, `duplicate/duplicate_and_wait`, `add/remove_members`, `add/remove_followers` | `%Asana.Project{}` (except duplicate ops: job map) |
| `Asana.Users` | `list_openapi/2` | `get/update`, `get_for_workspace/update_for_workspace` | `%Asana.User{}` |
| `Asana.Workspaces` | `list_openapi/1` | `get/update`, `add_user/remove_user` | `%Asana.Workspace{}` for get/update, `%Asana.User{}` for add_user, `%{}` for remove_user |
| `Asana.Attachments` | `list_openapi/2` | `upload/get/delete` | attachment map (`upload/get`) and `%{}` for delete |
| `Asana.Jobs` | n/a | `get`, `wait_until_complete`, `wait_for_duplicate` | job map |

Convenience wrappers for single-resource operations return unwrapped `data`:

```elixir
{:ok, task} = Asana.Tasks.get_openapi("task_gid", token: token)
{:ok, task} = Asana.Tasks.create_openapi(%{name: "Write docs", workspace: "workspace_gid"}, token: token)
{:ok, task} = Asana.Tasks.complete_openapi("task_gid", token: token)
{:ok, task} = Asana.Tasks.reopen_openapi("task_gid", token: token)
{:ok, _} = Asana.Tasks.delete_openapi("task_gid", token: token)
{:ok, job} = Asana.Tasks.duplicate_openapi("task_gid", %{name: "Copy"}, token: token)
{:ok, job} = Asana.Tasks.duplicate_and_wait_openapi("task_gid", %{name: "Copy"}, token: token)

{:ok, project} = Asana.Projects.get_openapi("project_gid", token: token)
{:ok, project} = Asana.Projects.update_openapi("project_gid", %{name: "Renamed"}, token: token)
{:ok, project} = Asana.Projects.archive_openapi("project_gid", token: token)
{:ok, project} = Asana.Projects.unarchive_openapi("project_gid", token: token)
{:ok, _} = Asana.Projects.delete_openapi("project_gid", token: token)
{:ok, job} = Asana.Projects.duplicate_openapi("project_gid", %{name: "Copy"}, token: token)
{:ok, job} = Asana.Projects.duplicate_and_wait_openapi("project_gid", %{name: "Copy"}, token: token)

{:ok, user} = Asana.Users.get_openapi("user_gid", token: token)
{:ok, user} = Asana.Users.update_openapi("user_gid", %{name: "Renamed User"}, token: token)
{:ok, user} = Asana.Users.get_for_workspace_openapi("workspace_gid", "user_gid", token: token)
{:ok, user} = Asana.Users.update_for_workspace_openapi("workspace_gid", "user_gid", %{name: "Renamed User"}, token: token)
{:ok, workspace} = Asana.Workspaces.get_openapi("workspace_gid", token: token)
{:ok, workspace} = Asana.Workspaces.update_openapi("workspace_gid", %{name: "Renamed Workspace"}, token: token)
{:ok, user} = Asana.Workspaces.add_user_openapi("workspace_gid", %{user: "user_gid"}, token: token)
{:ok, _} = Asana.Workspaces.remove_user_openapi("workspace_gid", %{user: "user_gid"}, token: token)

{:ok, attachment} =
  Asana.Attachments.upload_openapi(
    %{parent: "task_gid", file: {File.stream!("spec.pdf"), filename: "spec.pdf"}},
    token: token
  )
{:ok, attachment} = Asana.Attachments.get_openapi("attachment_gid", token: token)
{:ok, _} = Asana.Attachments.delete_openapi("attachment_gid", token: token)
```

Task wrappers (`get/create/update/complete/reopen`) return `%Asana.Task{}`.
Project wrappers (`get/create/update/archive/unarchive`) return `%Asana.Project{}`.
User wrappers (`get/update/get_for_workspace/update_for_workspace`) return `%Asana.User{}`.
Workspace wrappers (`get/update`) return `%Asana.Workspace{}`.
`Asana.Workspaces.add_user_openapi/3` returns `%Asana.User{}`.
`Asana.Workspaces.remove_user_openapi/3` returns `%{}` data.
`Asana.Attachments.upload_openapi/2` uses multipart upload (`form-data`) and returns
attachment data map.

Duplicate operations return jobs. Poll to completion with:

```elixir
{:ok, job} = Asana.Tasks.duplicate_openapi("task_gid", %{name: "Copy"}, token: token)
{:ok, done_job} = Asana.Jobs.wait_until_complete(job["gid"], token: token)
# or directly from duplicate result tuple:
{:ok, done_job} = Asana.Jobs.wait_for_duplicate({:ok, job}, token: token)
```

## Webhook signature helper

If you run your own webhook endpoint, `Asana.Webhook.Signature` can validate
the `x-hook-signature` header:

```elixir
valid? = Asana.Webhook.Signature.valid?(signature_header, webhook_secret, raw_body)
```

## Development status

- Core client with bearer auth and structured errors (`Asana.Client`, `Asana.Error`)
- Retry handling for 429 responses using `Retry-After`
- Stream-based pagination helper (`Asana.Pagination`)
- Initial resource module (`Asana.Tasks`)
- OpenAPI-backed stream wrappers for `Tasks`, `Projects`, `Users`, and `Workspaces`
- OpenAPI convenience wrappers for common get/create/update flows
- OpenAPI convenience wrappers for delete/archive/duplicate flows
- Typed Project/User/Workspace decoding with unknown-field capture
- Generated OpenAPI modules under `Asana.Generated.*`
- Stream bridge for generated operations (`Asana.OperationStream`, `*.list_openapi/*` wrappers)
- Typed Task decoding with unknown-field capture (`Asana.Task`, `Asana.Decode`)
- Webhook signature helper (`Asana.Webhook.Signature`)

## Guides

- `guides/getting_started.md`
- `guides/v0_1_scope.md`
- `guides/spec_update_workflow.md`

## Project policies

- `CONTRIBUTING.md`
- `CODE_OF_CONDUCT.md`
- `SECURITY.md`
- `SUPPORT.md`

## OpenAPI generation

Place the Asana OpenAPI spec at `priv/openapi/asana.yaml`, then run:

```bash
mix api.gen.asana
```

To pull the latest upstream spec and regenerate in one step:

```bash
mix api.refresh.asana
```

`mix api.gen.asana` first flattens schema `allOf` inheritance into
`priv/openapi/asana_flat.json` and then runs `oapi_generator` `default`.

Generated modules are written under `lib/asana/generated` in the
`Asana.Generated` namespace.

## Live smoke test

The suite excludes `:live` tests by default.

Run the real API smoke test with:

```bash
ASANA_TOKEN=your_token mix test --include live test/asana/live_smoke_test.exs
```

## Local quality commands

```bash
# matches CI jobs (includes dialyzer)
mix ci

# faster local loop (no dialyzer)
mix ci.fast
```
