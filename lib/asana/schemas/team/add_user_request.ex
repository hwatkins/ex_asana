defmodule Asana.Team.AddUserRequest do
  @moduledoc """
  Provides struct and type for a Team.AddUserRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, user: String.t() | nil}

  defstruct [:__info__, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [user: :string]
  end
end
