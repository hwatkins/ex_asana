defmodule Asana.Generated.Like do
  @moduledoc """
  Provides struct and type for a Like
  """

  @type t :: %__MODULE__{gid: String.t() | nil, user: Asana.Generated.UserCompact.t() | nil}

  defstruct [:gid, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, user: {Asana.Generated.UserCompact, :t}]
  end
end
