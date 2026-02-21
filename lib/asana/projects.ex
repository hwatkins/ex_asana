defmodule Asana.Projects do
  @moduledoc """
  Project resource functions.
  """

  alias Asana.Decode
  alias Asana.Jobs
  alias Asana.OpenAPI
  alias Asana.Project

  @generated_projects_module :"Elixir.Asana.Generated.Projects"
  @wait_option_keys [:max_attempts, :interval_ms, :sleep_fn]

  @spec list_openapi(String.t(), keyword()) :: Enumerable.t()
  def list_openapi(workspace_gid, opts \\ []) when is_binary(workspace_gid) and is_list(opts) do
    operation_opts =
      opts
      |> Keyword.put(:workspace, workspace_gid)

    @generated_projects_module
    |> OpenAPI.list(:get_projects, operation_opts, :generated_projects_not_available)
    |> Stream.map(&Decode.decode(&1, {Project, :compact}))
  end

  @spec get_openapi(String.t(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def get_openapi(project_gid, opts \\ []) when is_binary(project_gid) and is_list(opts) do
    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :get_project,
             [project_gid],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec create_openapi(map(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def create_openapi(attrs, opts \\ []) when is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :create_project,
             [body],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec update_openapi(String.t(), map(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def update_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :update_project,
             [project_gid, body],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec delete_openapi(String.t(), keyword()) :: {:ok, map()} | {:error, Asana.Error.t()}
  def delete_openapi(project_gid, opts \\ []) when is_binary(project_gid) and is_list(opts) do
    OpenAPI.call(
      @generated_projects_module,
      :delete_project,
      [project_gid],
      opts,
      :generated_projects_not_available
    )
  end

  @spec add_members_openapi(String.t(), map(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def add_members_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :add_members_for_project,
             [project_gid, body],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec remove_members_openapi(String.t(), map(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def remove_members_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :remove_members_for_project,
             [project_gid, body],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec add_followers_openapi(String.t(), map(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def add_followers_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :add_followers_for_project,
             [project_gid, body],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec remove_followers_openapi(String.t(), map(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def remove_followers_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, project} <-
           OpenAPI.call(
             @generated_projects_module,
             :remove_followers_for_project,
             [project_gid, body],
             opts,
             :generated_projects_not_available
           ) do
      {:ok, Decode.decode(project, {Project, :response})}
    end
  end

  @spec duplicate_openapi(String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Asana.Error.t()}
  def duplicate_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    OpenAPI.call(
      @generated_projects_module,
      :duplicate_project,
      [project_gid, body],
      opts,
      :generated_projects_not_available
    )
  end

  @spec duplicate_and_wait_openapi(String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Asana.Error.t()}
  def duplicate_and_wait_openapi(project_gid, attrs, opts \\ [])
      when is_binary(project_gid) and is_map(attrs) and is_list(opts) do
    duplicate_opts = Keyword.drop(opts, @wait_option_keys)

    with {:ok, job} <- duplicate_openapi(project_gid, attrs, duplicate_opts) do
      Jobs.wait_for_duplicate({:ok, job}, opts)
    end
  end

  @spec archive_openapi(String.t(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def archive_openapi(project_gid, opts \\ []) when is_binary(project_gid) and is_list(opts) do
    update_openapi(project_gid, %{archived: true}, opts)
  end

  @spec unarchive_openapi(String.t(), keyword()) ::
          {:ok, Project.response()} | {:error, Asana.Error.t()}
  def unarchive_openapi(project_gid, opts \\ []) when is_binary(project_gid) and is_list(opts) do
    update_openapi(project_gid, %{archived: false}, opts)
  end

  defp ensure_data_body(%{data: _} = body), do: body
  defp ensure_data_body(%{"data" => _} = body), do: body
  defp ensure_data_body(attrs), do: %{data: attrs}
end
