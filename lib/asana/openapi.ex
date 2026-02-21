defmodule Asana.OpenAPI do
  @moduledoc false

  alias Asana.Error
  alias Asana.OperationStream

  @spec list(module(), atom(), keyword(), atom()) :: Enumerable.t()
  def list(generated_module, function_name, opts, missing_reason)
      when is_atom(generated_module) and is_atom(function_name) and is_list(opts) and
             is_atom(missing_reason) do
    operation = fn operation_opts ->
      invoke(generated_module, function_name, [operation_opts], missing_reason)
    end

    OperationStream.list(operation, normalize_opt_fields(opts))
  end

  @spec call(module(), atom(), list(), keyword(), atom()) :: {:ok, term()} | {:error, Error.t()}
  def call(generated_module, function_name, args, opts, missing_reason)
      when is_atom(generated_module) and is_atom(function_name) and is_list(args) and
             is_list(opts) and is_atom(missing_reason) do
    args_with_opts = args ++ [normalize_opt_fields(opts)]

    case invoke(generated_module, function_name, args_with_opts, missing_reason) do
      {:ok, body} -> {:ok, unwrap_data(body)}
      {:error, %Error{} = error} -> {:error, error}
      {:error, reason} -> {:error, Error.request_failure(reason)}
    end
  end

  defp invoke(generated_module, function_name, args, missing_reason) do
    arity = length(args)

    if Code.ensure_loaded?(generated_module) and
         function_exported?(generated_module, function_name, arity) do
      apply(generated_module, function_name, args)
    else
      {:error, Error.request_failure(missing_reason)}
    end
  end

  defp normalize_opt_fields(opts) do
    case Keyword.get(opts, :opt_fields) do
      fields when is_list(fields) -> Keyword.put(opts, :opt_fields, Enum.join(fields, ","))
      _ -> opts
    end
  end

  defp unwrap_data(%{"data" => data}), do: data
  defp unwrap_data(%{data: data}), do: data
  defp unwrap_data(other), do: other
end
