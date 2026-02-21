defmodule Asana.Generated.ReactionCompact do
  @moduledoc """
  Provides struct and type for a ReactionCompact
  """

  @type t :: %__MODULE__{
          emoji: String.t() | nil,
          gid: String.t() | nil,
          user: Asana.Generated.UserCompact.t() | nil
        }

  defstruct [:emoji, :gid, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [emoji: :string, gid: :string, user: {Asana.Generated.UserCompact, :t}]
  end
end
