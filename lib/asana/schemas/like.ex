defmodule Asana.Like do
  @moduledoc """
  Provides struct and type for a Like
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, gid: String.t() | nil, user: Asana.User.compact() | nil}

  defstruct [:__info__, :gid, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, user: {Asana.User, :compact}]
  end
end
