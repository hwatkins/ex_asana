defmodule Asana.Decode do
  @moduledoc """
  Typed decoder for OpenAPI-generated field metadata.
  """

  @spec decode(term(), term()) :: term()
  def decode(nil, _type), do: nil
  def decode(value, :string), do: value
  def decode(value, :integer), do: value
  def decode(value, :number), do: value
  def decode(value, :boolean), do: value
  def decode(value, :map), do: value

  def decode(value, {:string, :date_time}) when is_binary(value), do: decode_datetime(value)
  def decode(value, {:string, "date-time"}) when is_binary(value), do: decode_datetime(value)
  def decode(value, {:string, :date}) when is_binary(value), do: decode_date(value)
  def decode(value, {:string, "date"}) when is_binary(value), do: decode_date(value)

  def decode(value, {:string, _}), do: value
  def decode(value, {:enum, _values}), do: value

  def decode(value, {:union, types}) when is_list(types) do
    decode(value, choose_union(value, types))
  end

  def decode(value, [type]) when is_list(value) do
    Enum.map(value, &decode(&1, type))
  end

  def decode(%{} = value, {module, type}) when is_atom(module) and is_atom(type) do
    if function_exported?(module, :__fields__, 1) do
      decode_struct(value, module, type)
    else
      value
    end
  end

  def decode(value, _type), do: value

  defp decode_struct(map, module, type) do
    base = struct(module)
    typed_fields = collect_typed_fields(module, type)
    struct_keys = Map.keys(base) -- [:__struct__, :__info__]

    {decoded, extra} =
      Enum.reduce(map, {base, %{}}, fn field, state ->
        decode_struct_field(field, state, struct_keys, typed_fields)
      end)

    Map.put(decoded, :__info__, extra)
  end

  defp decode_struct_field({key, value}, {acc, extras}, struct_keys, typed_fields) do
    atom_key = safe_to_atom(key)

    if atom_key && atom_key in struct_keys do
      field_type = Map.get(typed_fields, atom_key)
      decoded_value = if field_type, do: decode(value, field_type), else: value
      {Map.put(acc, atom_key, decoded_value), extras}
    else
      {acc, Map.put(extras, key, value)}
    end
  end

  defp collect_typed_fields(module, primary_type) do
    primary = safe_fields(module, primary_type)

    all_variants =
      [:t, :compact, :base, :response]
      |> Enum.reject(&(&1 == primary_type))
      |> Enum.flat_map(&safe_fields(module, &1))

    Map.new(all_variants) |> Map.merge(Map.new(primary))
  end

  defp safe_fields(module, type) do
    module.__fields__(type)
  rescue
    FunctionClauseError -> []
  end

  defp safe_to_atom(key) when is_binary(key) do
    String.to_existing_atom(key)
  rescue
    ArgumentError -> nil
  end

  defp safe_to_atom(key) when is_atom(key), do: key

  defp decode_datetime(value) do
    case DateTime.from_iso8601(value) do
      {:ok, dt, _offset} -> dt
      _ -> value
    end
  end

  defp decode_date(value) do
    case Date.from_iso8601(value) do
      {:ok, date} -> date
      _ -> value
    end
  end

  defp choose_union(nil, types) do
    if :null in types, do: :null, else: hd(types)
  end

  defp choose_union(value, types) do
    non_null = Enum.reject(types, &(&1 == :null))

    cond do
      length(non_null) == 1 ->
        hd(non_null)

      is_map(value) ->
        Enum.find(non_null, hd(non_null), fn
          {_module, _type} -> true
          :map -> true
          _ -> false
        end)

      is_list(value) ->
        Enum.find(non_null, hd(non_null), fn
          [_] -> true
          _ -> false
        end)

      is_binary(value) ->
        Enum.find(non_null, hd(non_null), fn
          {:string, _} -> true
          :string -> true
          _ -> false
        end)

      is_number(value) ->
        Enum.find(non_null, hd(non_null), fn
          :number -> true
          :integer -> true
          _ -> false
        end)

      true ->
        hd(non_null)
    end
  end
end
