defmodule Asana.CreateMembershipRequest do
  @moduledoc """
  Provides struct and type for a CreateMembershipRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          access_level: String.t() | nil,
          member: String.t() | nil,
          parent: String.t() | nil,
          role: String.t() | nil
        }

  defstruct [:__info__, :access_level, :member, :parent, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [access_level: :string, member: :string, parent: :string, role: :string]
  end
end
