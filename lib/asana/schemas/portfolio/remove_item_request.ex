defmodule Asana.Portfolio.RemoveItemRequest do
  @moduledoc """
  Provides struct and type for a Portfolio.RemoveItemRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, item: String.t()}

  defstruct [:__info__, :item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: :string]
  end
end
