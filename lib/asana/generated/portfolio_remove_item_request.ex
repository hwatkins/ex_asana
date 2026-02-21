defmodule Asana.Generated.PortfolioRemoveItemRequest do
  @moduledoc """
  Provides struct and type for a PortfolioRemoveItemRequest
  """

  @type t :: %__MODULE__{item: String.t()}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: :string]
  end
end
