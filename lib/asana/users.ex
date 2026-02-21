defmodule Asana.Users do
  @moduledoc """
  User resource functions.
  """

  alias Asana.Decode
  alias Asana.OpenAPI
  alias Asana.User

  @generated_users_module :"Elixir.Asana.Generated.Users"

  @spec list_openapi(String.t(), keyword()) :: Enumerable.t()
  def list_openapi(workspace_gid, opts \\ []) when is_binary(workspace_gid) and is_list(opts) do
    operation_opts =
      opts
      |> Keyword.put(:workspace, workspace_gid)

    @generated_users_module
    |> OpenAPI.list(:get_users, operation_opts, :generated_users_not_available)
    |> Stream.map(&Decode.decode(&1, {User, :compact}))
  end

  @spec get_openapi(String.t(), keyword()) ::
          {:ok, User.response()} | {:error, Asana.Error.t()}
  def get_openapi(user_gid, opts \\ []) when is_binary(user_gid) and is_list(opts) do
    with {:ok, user} <-
           OpenAPI.call(
             @generated_users_module,
             :get_user,
             [user_gid],
             opts,
             :generated_users_not_available
           ) do
      {:ok, Decode.decode(user, {User, :response})}
    end
  end

  @spec get_for_workspace_openapi(String.t(), String.t(), keyword()) ::
          {:ok, User.response()} | {:error, Asana.Error.t()}
  def get_for_workspace_openapi(workspace_gid, user_gid, opts \\ [])
      when is_binary(workspace_gid) and is_binary(user_gid) and is_list(opts) do
    with {:ok, user} <-
           OpenAPI.call(
             @generated_users_module,
             :get_user_for_workspace,
             [workspace_gid, user_gid],
             opts,
             :generated_users_not_available
           ) do
      {:ok, Decode.decode(user, {User, :response})}
    end
  end

  @spec update_openapi(String.t(), map(), keyword()) ::
          {:ok, User.response()} | {:error, Asana.Error.t()}
  def update_openapi(user_gid, attrs, opts \\ [])
      when is_binary(user_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, user} <-
           OpenAPI.call(
             @generated_users_module,
             :update_user,
             [user_gid, body],
             opts,
             :generated_users_not_available
           ) do
      {:ok, Decode.decode(user, {User, :response})}
    end
  end

  @spec update_for_workspace_openapi(String.t(), String.t(), map(), keyword()) ::
          {:ok, User.response()} | {:error, Asana.Error.t()}
  def update_for_workspace_openapi(workspace_gid, user_gid, attrs, opts \\ [])
      when is_binary(workspace_gid) and is_binary(user_gid) and is_map(attrs) and is_list(opts) do
    body = ensure_data_body(attrs)

    with {:ok, user} <-
           OpenAPI.call(
             @generated_users_module,
             :update_user_for_workspace,
             [workspace_gid, user_gid, body],
             opts,
             :generated_users_not_available
           ) do
      {:ok, Decode.decode(user, {User, :response})}
    end
  end

  defp ensure_data_body(%{data: _} = body), do: body
  defp ensure_data_body(%{"data" => _} = body), do: body
  defp ensure_data_body(attrs), do: %{data: attrs}
end
