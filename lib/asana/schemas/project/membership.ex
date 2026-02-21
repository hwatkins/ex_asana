defmodule Asana.Project.Membership do
  @moduledoc """
  Provides struct and type for a Project.Membership
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.Project.compact() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :access_level, :gid, :member, :parent, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      access_level: {:enum, ["admin", "editor", "commenter", "viewer"]},
      gid: :string,
      member: {Asana.Member, :compact},
      parent: {Asana.Project, :compact},
      resource_type: :string
    ]
  end
end
