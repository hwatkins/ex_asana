defmodule Asana.Generated.PortfolioAddItemRequest do
  @moduledoc """
  Provides struct and type for a PortfolioAddItemRequest
  """

  @type t :: %__MODULE__{
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          item: String.t()
        }

  defstruct [:insert_after, :insert_before, :item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [insert_after: :string, insert_before: :string, item: :string]
  end
end
