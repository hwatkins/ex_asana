defmodule Asana.Attachments do
  @moduledoc """
  Attachment resource functions.
  """

  alias Asana.OpenAPI

  @generated_attachments_module :"Elixir.Asana.Generated.Attachments"

  @spec upload_openapi(map() | keyword(), keyword()) :: {:ok, map()} | {:error, Asana.Error.t()}
  def upload_openapi(attrs, opts \\ [])
      when (is_map(attrs) or is_list(attrs)) and is_list(opts) do
    OpenAPI.call(
      @generated_attachments_module,
      :create_attachment_for_object,
      [attrs],
      opts,
      :generated_attachments_not_available
    )
  end

  @spec get_openapi(String.t(), keyword()) :: {:ok, map()} | {:error, Asana.Error.t()}
  def get_openapi(attachment_gid, opts \\ []) when is_binary(attachment_gid) and is_list(opts) do
    OpenAPI.call(
      @generated_attachments_module,
      :get_attachment,
      [attachment_gid],
      opts,
      :generated_attachments_not_available
    )
  end

  @spec delete_openapi(String.t(), keyword()) :: {:ok, map()} | {:error, Asana.Error.t()}
  def delete_openapi(attachment_gid, opts \\ [])
      when is_binary(attachment_gid) and is_list(opts) do
    OpenAPI.call(
      @generated_attachments_module,
      :delete_attachment,
      [attachment_gid],
      opts,
      :generated_attachments_not_available
    )
  end

  @spec list_openapi(String.t(), keyword()) :: Enumerable.t()
  def list_openapi(parent_gid, opts \\ []) when is_binary(parent_gid) and is_list(opts) do
    operation_opts = Keyword.put(opts, :parent, parent_gid)

    OpenAPI.list(
      @generated_attachments_module,
      :get_attachments_for_object,
      operation_opts,
      :generated_attachments_not_available
    )
  end
end
