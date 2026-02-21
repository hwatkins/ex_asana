defmodule Asana.Generated.UserResponse do
  @moduledoc """
  Provides struct and type for a UserResponse
  """

  @type t :: %__MODULE__{
          custom_fields: [Asana.Generated.CustomFieldCompact.t()] | nil,
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          photo: Asana.Generated.UserResponsePhoto.t() | nil,
          resource_type: String.t() | nil,
          workspaces: [Asana.Generated.WorkspaceCompact.t()] | nil
        }

  defstruct [:custom_fields, :email, :gid, :name, :photo, :resource_type, :workspaces]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_fields: [{Asana.Generated.CustomFieldCompact, :t}],
      email: {:string, "email"},
      gid: :string,
      name: :string,
      photo: {Asana.Generated.UserResponsePhoto, :t},
      resource_type: :string,
      workspaces: [{Asana.Generated.WorkspaceCompact, :t}]
    ]
  end
end
