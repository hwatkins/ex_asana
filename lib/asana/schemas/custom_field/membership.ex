defmodule Asana.CustomField.Membership do
  @moduledoc """
  Provides struct and types for a CustomField.Membership
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.CustomField.compact() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          gid: String.t() | nil,
          member: Asana.Member.compact() | nil,
          parent: Asana.CustomField.compact() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :access_level, :gid, :member, :parent, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [
      access_level: {:enum, ["admin", "editor", "user"]},
      gid: :string,
      member: {Asana.Member, :compact},
      parent: {Asana.CustomField, :compact},
      resource_subtype: :string,
      resource_type: :string
    ]
  end

  def __fields__(:response) do
    [
      access_level: {:enum, ["admin", "editor", "user"]},
      gid: :string,
      member: {Asana.Member, :compact},
      parent: {Asana.CustomField, :compact},
      resource_subtype: :string,
      resource_type: :string
    ]
  end
end
