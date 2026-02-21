defmodule Asana.Generated.WorkspaceMembershipCompact do
  @moduledoc """
  Provides struct and type for a WorkspaceMembershipCompact
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          resource_type: String.t() | nil,
          user: Asana.Generated.UserCompact.t() | nil,
          workspace: Asana.Generated.WorkspaceCompact.t() | nil
        }

  defstruct [:gid, :resource_type, :user, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      resource_type: :string,
      user: {Asana.Generated.UserCompact, :t},
      workspace: {Asana.Generated.WorkspaceCompact, :t}
    ]
  end
end
