defmodule Asana.Tasks do
  @moduledoc """
  Task resource functions.
  """

  alias Asana.Client
  alias Asana.Decode
  alias Asana.Jobs
  alias Asana.OpenAPI
  alias Asana.OperationStream
  alias Asana.Pagination
  alias Asana.Task

  @generated_tasks_module :"Elixir.Asana.Generated.Tasks"
  @wait_option_keys [:max_attempts, :interval_ms, :sleep_fn]

  @spec list(Client.t(), String.t(), keyword()) :: Enumerable.t()
  def list(%Client{} = client, project_gid, opts \\ [])
      when is_binary(project_gid) and is_list(opts) do
    base_params =
      %{"project" => project_gid}
      |> maybe_put_opt_fields(Keyword.get(opts, :opt_fields))

    Pagination.stream(fn offset ->
      params = maybe_put_offset(base_params, offset)

      case Client.request_full(client, method: :get, url: "/tasks", params: params) do
        {:ok, body} ->
          {:ok, %{data: extract_data(body), next_offset: extract_next_offset(body)}}

        {:error, error} ->
          {:error, error}
      end
    end)
  end

  @spec list_generated((keyword() -> {:ok, map()} | {:error, term()}), String.t(), keyword()) ::
          Enumerable.t()
  def list_generated(operation_fun, project_gid, opts \\ [])
      when is_function(operation_fun, 1) and is_binary(project_gid) and is_list(opts) do
    operation_opts =
      opts
      |> Keyword.put(:project, project_gid)
      |> maybe_normalize_opt_fields()

    operation_fun
    |> OperationStream.list(operation_opts)
    |> Stream.map(&Decode.decode(&1, {Task, :response}))
  end

  @spec list_openapi(String.t(), keyword()) :: Enumerable.t()
  def list_openapi(project_gid, opts \\ []) when is_binary(project_gid) and is_list(opts) do
    operation_opts =
      opts
      |> Keyword.put(:project, project_gid)

    @generated_tasks_module
    |> OpenAPI.list(:get_tasks, operation_opts, :generated_tasks_not_available)
    |> Stream.map(&Decode.decode(&1, {Task, :response}))
  end

  @spec get_openapi(String.t(), keyword()) :: {:ok, Task.response()} | {:error, Asana.Error.t()}
  def get_openapi(task_gid, opts \\ []) when is_binary(task_gid) and is_list(opts) do
    with {:ok, task} <-
           OpenAPI.call(
             @generated_tasks_module,
             :get_task,
             [task_gid],
             opts,
             :generated_tasks_not_available
           ) do
      {:ok, Decode.decode(task, {Task, :response})}
    end
  end

  @spec create_openapi(map(), keyword()) :: {:ok, Task.response()} | {:error, Asana.Error.t()}
  def create_openapi(attrs, opts \\ []) when is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, task} <-
           OpenAPI.call(
             @generated_tasks_module,
             :create_task,
             [body],
             opts,
             :generated_tasks_not_available
           ) do
      {:ok, Decode.decode(task, {Task, :response})}
    end
  end

  @spec update_openapi(String.t(), map(), keyword()) ::
          {:ok, Task.response()} | {:error, Asana.Error.t()}
  def update_openapi(task_gid, attrs, opts \\ [])
      when is_binary(task_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, task} <-
           OpenAPI.call(
             @generated_tasks_module,
             :update_task,
             [task_gid, body],
             opts,
             :generated_tasks_not_available
           ) do
      {:ok, Decode.decode(task, {Task, :response})}
    end
  end

  @spec complete_openapi(String.t(), keyword()) ::
          {:ok, Task.response()} | {:error, Asana.Error.t()}
  def complete_openapi(task_gid, opts \\ []) when is_binary(task_gid) and is_list(opts) do
    update_openapi(task_gid, %{completed: true}, opts)
  end

  @spec reopen_openapi(String.t(), keyword()) ::
          {:ok, Task.response()} | {:error, Asana.Error.t()}
  def reopen_openapi(task_gid, opts \\ []) when is_binary(task_gid) and is_list(opts) do
    update_openapi(task_gid, %{completed: false}, opts)
  end

  @spec duplicate_openapi(String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Asana.Error.t()}
  def duplicate_openapi(task_gid, attrs, opts \\ [])
      when is_binary(task_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    OpenAPI.call(
      @generated_tasks_module,
      :duplicate_task,
      [task_gid, body],
      opts,
      :generated_tasks_not_available
    )
  end

  @spec duplicate_and_wait_openapi(String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Asana.Error.t()}
  def duplicate_and_wait_openapi(task_gid, attrs, opts \\ [])
      when is_binary(task_gid) and is_map(attrs) and is_list(opts) do
    duplicate_opts = Keyword.drop(opts, @wait_option_keys)

    with {:ok, job} <- duplicate_openapi(task_gid, attrs, duplicate_opts) do
      Jobs.wait_for_duplicate({:ok, job}, opts)
    end
  end

  @spec delete_openapi(String.t(), keyword()) :: {:ok, map()} | {:error, Asana.Error.t()}
  def delete_openapi(task_gid, opts \\ []) when is_binary(task_gid) and is_list(opts) do
    OpenAPI.call(
      @generated_tasks_module,
      :delete_task,
      [task_gid],
      opts,
      :generated_tasks_not_available
    )
  end

  defp maybe_put_opt_fields(params, nil), do: params

  defp maybe_put_opt_fields(params, fields) when is_binary(fields),
    do: Map.put(params, "opt_fields", fields)

  defp maybe_put_opt_fields(params, fields) when is_list(fields) do
    Map.put(params, "opt_fields", Enum.join(fields, ","))
  end

  defp maybe_normalize_opt_fields(opts) do
    case Keyword.get(opts, :opt_fields) do
      fields when is_list(fields) -> Keyword.put(opts, :opt_fields, Enum.join(fields, ","))
      _ -> opts
    end
  end

  defp maybe_put_offset(params, nil), do: params
  defp maybe_put_offset(params, offset), do: Map.put(params, "offset", offset)

  defp extract_data(%{"data" => data}) when is_list(data), do: decode_tasks(data)
  defp extract_data(%{data: data}) when is_list(data), do: decode_tasks(data)
  defp extract_data(_), do: []

  defp decode_tasks(tasks) when is_list(tasks) do
    Enum.map(tasks, &Decode.decode(&1, {Task, :response}))
  end

  defp extract_next_offset(%{"next_page" => %{"offset" => offset}}) when is_binary(offset),
    do: offset

  defp extract_next_offset(%{next_page: %{offset: offset}}) when is_binary(offset), do: offset
  defp extract_next_offset(_), do: nil

  defp ensure_data_body(%{data: _} = body), do: body
  defp ensure_data_body(%{"data" => _} = body), do: body
  defp ensure_data_body(attrs), do: %{data: attrs}
end
