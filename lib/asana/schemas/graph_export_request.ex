defmodule Asana.GraphExportRequest do
  @moduledoc """
  Provides struct and type for a GraphExportRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, parent: String.t() | nil}

  defstruct [:__info__, :parent]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parent: :string]
  end
end
