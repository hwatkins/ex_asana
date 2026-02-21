defmodule Asana.RbacRoleRequest do
  @moduledoc """
  Provides struct and type for a RbacRoleRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          base_role_type: String.t() | nil,
          creation_time: DateTime.t() | nil,
          description: String.t() | nil,
          gid: String.t() | nil,
          is_standard_role: boolean | nil,
          modified_at: DateTime.t() | nil,
          name: String.t() | nil,
          permissions: Asana.RbacRoleRequestPermissions.t() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.RbacRoleRequestWorkspace.t() | nil
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
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      base_role_type: {:enum, ["guest", "member", "admin", "super_admin"]},
      creation_time: {:string, "date-time"},
      description: :string,
      gid: :string,
      is_standard_role: :boolean,
      modified_at: {:string, "date-time"},
      name: :string,
      permissions: {Asana.RbacRoleRequestPermissions, :t},
      resource_type: :string,
      workspace: {Asana.RbacRoleRequestWorkspace, :t}
    ]
  end
end
