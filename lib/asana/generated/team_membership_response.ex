defmodule Asana.Generated.TeamMembershipResponse do
  @moduledoc """
  Provides struct and type for a TeamMembershipResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          is_admin: boolean | nil,
          is_guest: boolean | nil,
          is_limited_access: boolean | nil,
          resource_type: String.t() | nil,
          team: Asana.Generated.TeamCompact.t() | nil,
          user: Asana.Generated.UserCompact.t() | nil
        }

  defstruct [:gid, :is_admin, :is_guest, :is_limited_access, :resource_type, :team, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      is_admin: :boolean,
      is_guest: :boolean,
      is_limited_access: :boolean,
      resource_type: :string,
      team: {Asana.Generated.TeamCompact, :t},
      user: {Asana.Generated.UserCompact, :t}
    ]
  end
end
