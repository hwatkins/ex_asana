defmodule Asana.Team.Membership do
  @moduledoc """
  Provides struct and types for a Team.Membership
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          is_admin: boolean | nil,
          is_guest: boolean | nil,
          is_limited_access: boolean | nil,
          resource_type: String.t() | nil,
          team: Asana.Team.compact() | nil,
          user: Asana.User.compact() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          is_admin: boolean | nil,
          is_guest: boolean | nil,
          is_limited_access: boolean | nil,
          resource_type: String.t() | nil,
          team: Asana.Team.compact() | nil,
          user: Asana.User.compact() | nil
        }

  defstruct [
    :__info__,
    :gid,
    :is_admin,
    :is_guest,
    :is_limited_access,
    :resource_type,
    :team,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      gid: :string,
      is_admin: :boolean,
      is_guest: :boolean,
      is_limited_access: :boolean,
      resource_type: :string,
      team: {Asana.Team, :compact},
      user: {Asana.User, :compact}
    ]
  end

  def __fields__(:response) do
    [
      gid: :string,
      is_admin: :boolean,
      is_guest: :boolean,
      is_limited_access: :boolean,
      resource_type: :string,
      team: {Asana.Team, :compact},
      user: {Asana.User, :compact}
    ]
  end
end
