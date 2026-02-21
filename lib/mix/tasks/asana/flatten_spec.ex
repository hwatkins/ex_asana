defmodule Mix.Tasks.Asana.FlattenSpec do
  @moduledoc """
  Flattens allOf schema-level inheritance in an OpenAPI spec.

  The `oapi_generator` only resolves allOf one level deep. When a parent schema's
  properties live inside its own allOf entries, they're missed. This task recursively
  resolves all schema-level allOf chains and merges inherited properties into flat
  `type: object` schemas with explicit `properties` maps.

  ## Usage

      mix asana.flatten_spec asana_oas.yaml
      mix asana.flatten_spec asana_oas.yaml --output asana_oas_flat.json
  """

  use Mix.Task

  @default_output "asana_oas_flat.json"

  @impl Mix.Task
  def run(args) do
    {opts, rest} = OptionParser.parse!(args, strict: [output: :string])
    output = Keyword.get(opts, :output, @default_output)

    input =
      case rest do
        [path] -> path
        _ -> Mix.raise("Usage: mix asana.flatten_spec <spec.yaml> [--output file.json]")
      end

    Mix.shell().info("Reading #{input}...")
    spec = YamlElixir.read_from_file!(input)

    Mix.shell().info("Flattening allOf inheritance in schemas...")
    spec = flatten_schemas(spec)

    json = JSON.encode!(spec)
    File.write!(output, json)
    Mix.shell().info("Wrote flattened spec to #{output}")
  end

  defp flatten_schemas(spec) do
    schemas = get_in(spec, ["components", "schemas"]) || %{}

    # Use an Agent for memoization to handle chains efficiently
    {:ok, cache} = Agent.start_link(fn -> %{} end)

    resolved =
      Map.new(schemas, fn {name, _schema} ->
        {name, resolve_schema(name, schemas, cache)}
      end)

    Agent.stop(cache)

    put_in(spec, ["components", "schemas"], resolved)
  end

  defp resolve_schema(name, schemas, cache) do
    cached = Agent.get(cache, &Map.get(&1, name))

    case cached do
      # :resolving sentinel detects circular refs
      :resolving -> schemas[name]
      nil -> do_resolve(name, schemas, cache)
      resolved -> resolved
    end
  end

  defp do_resolve(name, schemas, cache) do
    Agent.update(cache, &Map.put(&1, name, :resolving))
    schema = schemas[name]
    resolved = resolve(schema, schemas, cache)
    Agent.update(cache, &Map.put(&1, name, resolved))
    resolved
  end

  # Pure $ref at schema level: follow the ref and return the resolved target
  defp resolve(%{"$ref" => ref} = schema, schemas, cache) when map_size(schema) == 1 do
    target_name = ref_name(ref)
    resolve_schema(target_name, schemas, cache)
  end

  # Schema with allOf: flatten the chain
  defp resolve(%{"allOf" => all_of} = schema, schemas, cache) do
    {merged_props, merged_required, merged_desc, merged_type} =
      Enum.reduce(all_of, {%{}, [], nil, nil}, fn entry, {props, req, desc, type} ->
        resolved_entry = resolve_allof_entry(entry, schemas, cache)

        entry_props = resolved_entry["properties"] || %{}
        entry_req = resolved_entry["required"] || []
        entry_desc = resolved_entry["description"]
        entry_type = resolved_entry["type"]

        {
          Map.merge(props, entry_props),
          req ++ entry_req,
          desc || entry_desc,
          type || entry_type
        }
      end)

    # Start with the original schema, remove allOf, add merged properties
    result =
      schema
      |> Map.delete("allOf")
      |> Map.put("type", merged_type || "object")
      |> Map.put("properties", merged_props)

    result =
      case Enum.uniq(merged_required) do
        [] -> result
        reqs -> Map.put(result, "required", reqs)
      end

    # Preserve description from the schema itself, or use inherited
    case schema["description"] || merged_desc do
      nil -> result
      desc -> Map.put(result, "description", desc)
    end
  end

  # Plain schema (no allOf, no $ref at top level): return as-is
  defp resolve(schema, _schemas, _cache), do: schema

  # Resolve a single allOf entry
  defp resolve_allof_entry(%{"$ref" => ref}, schemas, cache) do
    target_name = ref_name(ref)
    resolve_schema(target_name, schemas, cache)
  end

  defp resolve_allof_entry(inline, _schemas, _cache), do: inline

  # Extract schema name from a $ref like "#/components/schemas/TaskCompact"
  defp ref_name("#/components/schemas/" <> name), do: name

  defp ref_name(ref) do
    Mix.raise("Unsupported $ref format: #{ref}")
  end
end
