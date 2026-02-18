# Asana

Elixir wrapper for the [Asana REST API](https://developers.asana.com/reference/rest-api-reference), using [`Req`](https://hex.pm/packages/req) as the HTTP transport.

## Install

Add to `mix.exs`:

```elixir
def deps do
  [{:asana, "~> 1.0"}]
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

## Development

```bash
mix deps.get
mix test
mix format
```
