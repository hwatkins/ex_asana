defmodule Asana.Generated.DeprecatedPortfolioMembershipCompact do
  @moduledoc """
  Provides struct and type for a DeprecatedPortfolioMembershipCompact
  """

  @type t :: %__MODULE__{
          access_level: String.t() | nil,
          gid: String.t() | nil,
          portfolio: Asana.Generated.PortfolioCompact.t() | nil,
          resource_type: String.t() | nil,
          user: Asana.Generated.UserCompact.t() | nil
        }

  defstruct [:access_level, :gid, :portfolio, :resource_type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      access_level: {:enum, ["admin", "editor", "viewer"]},
      gid: :string,
      portfolio: {Asana.Generated.PortfolioCompact, :t},
      resource_type: :string,
      user: {Asana.Generated.UserCompact, :t}
    ]
  end
end
