defmodule Asana.Goal.MembershipParent do
  @moduledoc """
  Provides struct and types for a Goal.MembershipParent
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: map | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: map | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :gid, :name, :owner, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, owner: :map, resource_type: :string]
  end

  def __fields__(:response) do
    [gid: :string, name: :string, owner: :map, resource_type: :string]
  end
end
