defmodule Asana.Portfolio.Membership do
  @moduledoc """
  Provides struct and types for a Portfolio.Membership
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          portfolio: Asana.Portfolio.compact() | nil,
          resource_type: String.t() | nil,
          user: Asana.User.compact() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.Portfolio.compact() | nil,
          portfolio: Asana.Portfolio.compact() | nil,
          resource_type: String.t() | nil,
          user: Asana.User.compact() | nil
        }

  defstruct [:__info__, :access_level, :gid, :member, :parent, :portfolio, :resource_type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      access_level: {:enum, ["admin", "editor", "viewer"]},
      gid: :string,
      portfolio: {Asana.Portfolio, :compact},
      resource_type: :string,
      user: {Asana.User, :compact}
    ]
  end

  def __fields__(:response) do
    [
      access_level: {:enum, ["admin", "editor", "viewer"]},
      gid: :string,
      member: {Asana.Member, :compact},
      parent: {Asana.Portfolio, :compact},
      portfolio: {Asana.Portfolio, :compact},
      resource_type: :string,
      user: {Asana.User, :compact}
    ]
  end
end
