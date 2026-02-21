defmodule Asana.Reaction.SummaryItem do
  @moduledoc """
  Provides struct and type for a Reaction.SummaryItem
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          count: number | nil,
          emoji_base: String.t() | nil,
          reacted: boolean | nil,
          variant: String.t() | nil
        }

  defstruct [:__info__, :count, :emoji_base, :reacted, :variant]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [count: :number, emoji_base: :string, reacted: :boolean, variant: :string]
  end
end
