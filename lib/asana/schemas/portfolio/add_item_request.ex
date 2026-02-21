defmodule Asana.Portfolio.AddItemRequest do
  @moduledoc """
  Provides struct and type for a Portfolio.AddItemRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          item: String.t()
        }

  defstruct [:__info__, :insert_after, :insert_before, :item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, item: :string]
  end
end
