defmodule Asana.Generated.ReactionSummaryItemCompact do
  @moduledoc """
  Provides struct and type for a ReactionSummaryItemCompact
  """

  @type t :: %__MODULE__{
          count: number | nil,
          emoji_base: String.t() | nil,
          reacted: boolean | nil,
          variant: String.t() | nil
        }

  defstruct [:count, :emoji_base, :reacted, :variant]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :number, emoji_base: :string, reacted: :boolean, variant: :string]
  end
end
