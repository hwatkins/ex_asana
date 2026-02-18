# Asana

Elixir wrapper for the [Asana REST API](https://developers.asana.com/reference/rest-api-reference), using [`Req`](https://hex.pm/packages/req) as the HTTP transport.

## Install

Add to `mix.exs`:

```elixir
def deps do
  [{:asana, "~> 0.5"}]
end
```

## Req Client Pattern

Create a connection once and pass it into API modules:

```elixir
connection = Asana.Connection.new(System.fetch_env!("ASANA_ACCESS_TOKEN"))

{:ok, workspace_list} =
  Asana.Api.Workspaces.get_all_workspaces(connection, opt_fields: ["gid", "name"])
```

You can also use a token fetcher callback:

```elixir
connection = Asana.Connection.new(fn _scopes -> fetch_token_somehow() end)
```

## Examples

List tasks in a project:

```elixir
project_gid = 1234567890

{:ok, %Asana.Model.TaskArray{data: tasks}} =
  Asana.Api.Tasks.get_project_tasks(
    connection,
    project_gid,
    opt_fields: ["gid", "name", "completed"]
  )
```

Create a task:

```elixir
workspace_gid = 1234567890

payload = %Asana.Model.TaskObject{
  data: %Asana.Model.Task{
    name: "Ship v0.5.0",
    notes: "Finalize release and publish package.",
    workspace: %Asana.Model.WorkspaceCompact{gid: workspace_gid}
  }
}

{:ok, %Asana.Model.TaskObject{data: task}} = Asana.Api.Tasks.create_task(connection, payload)
```

Update a task:

```elixir
task_gid = "1234567890"

payload = %Asana.Model.TaskObject{
  data: %Asana.Model.Task{name: "Ship v0.5.0 ✅"}
}

{:ok, %Asana.Model.TaskObject{data: task}} =
  Asana.Api.Tasks.update_task(connection, task_gid, payload)
```

Upload an attachment to a task:

```elixir
task_gid = 1234567890

{:ok, %Asana.Model.AttachmentObject{data: attachment}} =
  Asana.Api.Attachments.upload_attachment_to_task(
    connection,
    task_gid,
    file: "/absolute/path/to/release-notes.pdf"
  )
```

Create a webhook:

```elixir
project_gid = 1234567890

payload = %Asana.Model.InlineObject18{
  resource: project_gid,
  target: "https://example.com/asana/webhooks"
}

{:ok, %Asana.Model.WebhookObject{data: webhook}} =
  Asana.Api.Webhooks.create_webhook(connection, payload)
```

Basic error handling:

```elixir
case Asana.Api.Tasks.get_task(connection, "1234567890") do
  {:ok, task} ->
    task

  {:error, %Req.Response{status: status, body: body}} ->
    IO.inspect({status, body}, label: "Asana request failed")
end
```

## Development

```bash
mix deps.get
mix test
mix format
```

## License

MIT. See `LICENSE`.
