defmodule Asana.Workspaces do
  @moduledoc """
  Workspace resource functions.
  """

  alias Asana.Decode
  alias Asana.OpenAPI
  alias Asana.User
  alias Asana.Workspace

  @generated_workspaces_module :"Elixir.Asana.Generated.Workspaces"

  @spec list_openapi(keyword()) :: Enumerable.t()
  def list_openapi(opts \\ []) when is_list(opts) do
    @generated_workspaces_module
    |> OpenAPI.list(:get_workspaces, opts, :generated_workspaces_not_available)
    |> Stream.map(&Decode.decode(&1, {Workspace, :compact}))
  end

  @spec get_openapi(String.t(), keyword()) ::
          {:ok, Workspace.response()} | {:error, Asana.Error.t()}
  def get_openapi(workspace_gid, opts \\ []) when is_binary(workspace_gid) and is_list(opts) do
    with {:ok, workspace} <-
           OpenAPI.call(
             @generated_workspaces_module,
             :get_workspace,
             [workspace_gid],
             opts,
             :generated_workspaces_not_available
           ) do
      {:ok, Decode.decode(workspace, {Workspace, :response})}
    end
  end

  @spec update_openapi(String.t(), map(), keyword()) ::
          {:ok, Workspace.response()} | {:error, Asana.Error.t()}
  def update_openapi(workspace_gid, attrs, opts \\ [])
      when is_binary(workspace_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, workspace} <-
           OpenAPI.call(
             @generated_workspaces_module,
             :update_workspace,
             [workspace_gid, body],
             opts,
             :generated_workspaces_not_available
           ) do
      {:ok, Decode.decode(workspace, {Workspace, :response})}
    end
  end

  @spec add_user_openapi(String.t(), map(), keyword()) ::
          {:ok, User.response()} | {:error, Asana.Error.t()}
  def add_user_openapi(workspace_gid, attrs, opts \\ [])
      when is_binary(workspace_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, user} <-
           OpenAPI.call(
             @generated_workspaces_module,
             :add_user_for_workspace,
             [workspace_gid, body],
             opts,
             :generated_workspaces_not_available
           ) do
      {:ok, Decode.decode(user, {User, :response})}
    end
  end

  @spec remove_user_openapi(String.t(), map(), keyword()) ::
          {:ok, map()} | {:error, Asana.Error.t()}
  def remove_user_openapi(workspace_gid, attrs, opts \\ [])
      when is_binary(workspace_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    OpenAPI.call(
      @generated_workspaces_module,
      :remove_user_for_workspace,
      [workspace_gid, body],
      opts,
      :generated_workspaces_not_available
    )
  end

  defp ensure_data_body(%{data: _} = body), do: body
  defp ensure_data_body(%{"data" => _} = body), do: body
  defp ensure_data_body(attrs), do: %{data: attrs}
end
