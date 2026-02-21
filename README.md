# Asana

Elixir wrapper for the [Asana REST API](https://developers.asana.com/reference/rest-api-reference), using [`Req`](https://hex.pm/packages/req) as the HTTP transport.

Generated from the [Asana OpenAPI spec](https://github.com/Asana/openapi) using [`oapi_generator`](https://hex.pm/packages/oapi_generator).

Requires Elixir >= 1.18.

## Install

Add to `mix.exs`:

```elixir
def deps do
  [{:asana, "~> 0.6"}]
end
```

## Usage

Create a connection and pass it to API operations via the `connection` option:

```elixir
connection = Asana.Connection.new(System.fetch_env!("ASANA_ACCESS_TOKEN"))

{:ok, result} =
  Asana.Workspaces.get_workspaces(connection: connection, opt_fields: "gid,name")
```

You can also use a token fetcher callback:

```elixir
connection = Asana.Connection.new(fn _scopes -> fetch_token_somehow() end)
```

## Examples

Get a task:

```elixir
{:ok, %{data: task}} =
  Asana.Tasks.get_task("1234567890",
    connection: connection,
    opt_fields: "gid,name,completed,assignee"
  )
```

List tasks in a project:

```elixir
{:ok, %{data: tasks}} =
  Asana.Tasks.get_tasks_for_project("1234567890",
    connection: connection,
    opt_fields: "gid,name,completed"
  )
```

Create a task:

```elixir
{:ok, %{data: task}} =
  Asana.Tasks.create_task(
    %{data: %{name: "Ship v0.6.0", workspace: "1234567890"}},
    connection: connection
  )
```

Error handling:

```elixir
case Asana.Tasks.get_task("1234567890", connection: connection) do
  {:ok, %{data: task}} ->
    task

  {:error, %Asana.Error{errors: errors}} ->
    IO.inspect(errors, label: "Asana API error")
end
```

## Development

```bash
mix deps.get
mix test
mix format
```

### Regenerating from the OpenAPI spec

```bash
curl -L -o asana_oas.yaml \
  https://raw.githubusercontent.com/Asana/openapi/master/defs/asana_oas.yaml

mix asana.flatten_spec asana_oas.yaml
mix api.gen default asana_oas_flat.json
mix format
```

## License

MIT. See `LICENSE`.
