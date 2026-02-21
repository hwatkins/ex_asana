# Getting Started

This guide covers token-based API calls and stream pagination with `ex_asana`.

## Install

Add `ex_asana` to your dependency list:

```elixir
def deps do
  [
    {:ex_asana, "~> 0.1.0"}
  ]
end
```

Then fetch deps:

```bash
mix deps.get
```

## Configure Token

Either pass a token per client:

```elixir
client = Asana.client(token: System.fetch_env!("ASANA_TOKEN"))
```

Or set it in app config:

```elixir
config :ex_asana,
  token: System.fetch_env!("ASANA_TOKEN")
```

## Fetch Tasks With Lazy Pagination

`Asana.Tasks.list/3` returns a stream and follows Asana `next_page.offset`
cursors automatically.

```elixir
client = Asana.client()

tasks =
  client
  |> Asana.Tasks.list("project_gid", opt_fields: ["gid", "name", "completed"])
  |> Enum.take(20)
```

## Use OpenAPI Wrappers

The generated OpenAPI modules are wrapped with convenience helpers:

```elixir
token = System.fetch_env!("ASANA_TOKEN")

{:ok, task} = Asana.Tasks.get_openapi("task_gid", token: token)
{:ok, project} = Asana.Projects.get_openapi("project_gid", token: token)
{:ok, project} = Asana.Projects.update_openapi("project_gid", %{name: "Renamed"}, token: token)
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

For list operations:

```elixir
Asana.Projects.list_openapi("workspace_gid", token: token)
|> Enum.take(10)
```

## Duplicate + Poll Job Completion

```elixir
{:ok, job} = Asana.Tasks.duplicate_openapi("task_gid", %{name: "Copy"}, token: token)
{:ok, done_job} = Asana.Jobs.wait_until_complete(job["gid"], token: token)
```

## Run Tests

```bash
mix test
```

Live smoke tests are tagged and excluded by default:

```bash
ASANA_TOKEN=your_token mix test --include live test/asana/live_smoke_test.exs
```
