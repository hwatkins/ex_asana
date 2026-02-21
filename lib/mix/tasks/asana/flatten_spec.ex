defmodule Mix.Tasks.Asana.FlattenSpec do
  @moduledoc """
  Flattens schema-level `allOf` inheritance in an OpenAPI spec.

  This prevents inherited properties from being dropped by downstream
  code generation when parent schemas also use `allOf`.
  """

  use Mix.Task

  @default_output "priv/openapi/asana_flat.json"

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
    spec = read_yaml_file!(input)

    Mix.shell().info("Flattening allOf inheritance in schemas...")
    spec = flatten_schemas(spec)

    json = Jason.encode!(spec)
    File.write!(output, json)
    Mix.shell().info("Wrote flattened spec to #{output}")
  end

  defp flatten_schemas(spec) do
    schemas = get_in(spec, ["components", "schemas"]) || %{}
    {:ok, cache} = Agent.start_link(fn -> %{} end)

    resolved =
      Map.new(schemas, fn {name, _schema} ->
        {name, resolve_schema(name, schemas, cache)}
      end)

    Agent.stop(cache)
    put_in(spec, ["components", "schemas"], resolved)
  end

  defp resolve_schema(name, schemas, cache) do
    case Agent.get(cache, &Map.get(&1, name)) do
      :resolving -> schemas[name]
      nil -> do_resolve(name, schemas, cache)
      resolved -> resolved
    end
  end

  defp do_resolve(name, schemas, cache) do
    Agent.update(cache, &Map.put(&1, name, :resolving))
    resolved = resolve(schemas[name], schemas, cache)
    Agent.update(cache, &Map.put(&1, name, resolved))
    resolved
  end

  defp resolve(%{"$ref" => ref} = schema, schemas, cache) when map_size(schema) == 1 do
    resolve_schema(ref_name(ref), schemas, cache)
  end

  defp resolve(%{"allOf" => all_of} = schema, schemas, cache) do
    {props, required, desc, type} =
      Enum.reduce(all_of, {%{}, [], nil, nil}, fn entry,
                                                  {acc_props, acc_req, acc_desc, acc_type} ->
        resolved_entry = resolve_allof_entry(entry, schemas, cache)
        entry_props = resolved_entry["properties"] || %{}
        entry_req = resolved_entry["required"] || []

        {
          Map.merge(acc_props, entry_props),
          acc_req ++ entry_req,
          acc_desc || resolved_entry["description"],
          acc_type || resolved_entry["type"]
        }
      end)

    base =
      schema
      |> Map.delete("allOf")
      |> Map.put("type", type || "object")
      |> Map.put("properties", props)
      |> maybe_put_required(required)

    case schema["description"] || desc do
      nil -> base
      description -> Map.put(base, "description", description)
    end
  end

  defp resolve(schema, _schemas, _cache), do: schema

  defp resolve_allof_entry(%{"$ref" => ref}, schemas, cache) do
    resolve_schema(ref_name(ref), schemas, cache)
  end

  defp resolve_allof_entry(inline, _schemas, _cache), do: inline

  defp maybe_put_required(result, required) do
    case Enum.uniq(required) do
      [] -> result
      reqs -> Map.put(result, "required", reqs)
    end
  end

  defp ref_name("#/components/schemas/" <> name), do: name
  defp ref_name(ref), do: Mix.raise("Unsupported $ref format: #{ref}")

  defp read_yaml_file!(path) do
    yaml_module = Module.concat([YamlElixir])

    if Code.ensure_loaded?(yaml_module) and function_exported?(yaml_module, :read_from_file!, 1) do
      yaml_module.read_from_file!(path)
    else
      Mix.raise("YamlElixir is required to flatten specs. Run this task in MIX_ENV=dev.")
    end
  end
end
