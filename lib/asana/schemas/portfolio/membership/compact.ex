defmodule Asana.Portfolio.Membership.Compact do
  @moduledoc """
  Provides struct and type for a Portfolio.Membership.Compact
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.Portfolio.compact() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :access_level, :gid, :member, :parent, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      access_level: {:enum, ["admin", "editor", "viewer"]},
      gid: :string,
      member: {Asana.Member, :compact},
      parent: {Asana.Portfolio, :compact},
      resource_subtype: :string,
      resource_type: :string
    ]
  end
end
