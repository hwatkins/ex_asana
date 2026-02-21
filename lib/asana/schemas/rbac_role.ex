defmodule Asana.RbacRole do
  @moduledoc """
  Provides struct and types for a RbacRole
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          gid: String.t() | nil,
          is_standard_role: boolean | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          base_role_type: String.t() | nil,
          creation_time: DateTime.t() | nil,
          description: String.t() | nil,
          gid: String.t() | nil,
          is_standard_role: boolean | nil,
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          permissions: Asana.RbacRolePermissions.response() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.RbacRoleWorkspace.response() | nil
        }

  defstruct [
    :__info__,
    :base_role_type,
    :creation_time,
    :description,
    :gid,
    :is_standard_role,
    :modified_at,
    :name,
    :permissions,
    :resource_type,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      description: :string,
      gid: :string,
      is_standard_role: :boolean,
      name: :string,
      resource_type: :string
    ]
  end

  def __fields__(:response) do
    [
      base_role_type: {:enum, ["guest", "member", "admin", "super_admin"]},
      creation_time: {:string, "date-time"},
      description: :string,
      gid: :string,
      is_standard_role: :boolean,
      modified_at: {:string, "date-time"},
      name: :string,
      permissions: {Asana.RbacRolePermissions, :response},
      resource_type: :string,
      workspace: {Asana.RbacRoleWorkspace, :response}
    ]
  end
end
