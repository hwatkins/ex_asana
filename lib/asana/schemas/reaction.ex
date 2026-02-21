defmodule Asana.Reaction do
  @moduledoc """
  Provides struct and type for a Reaction
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          emoji: String.t() | nil,
          gid: String.t() | nil,
          user: Asana.User.compact() | nil
        }

  defstruct [:__info__, :emoji, :gid, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [emoji: :string, gid: :string, user: {Asana.User, :compact}]
  end
end
