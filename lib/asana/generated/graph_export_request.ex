defmodule Asana.Generated.GraphExportRequest do
  @moduledoc """
  Provides struct and type for a GraphExportRequest
  """

  @type t :: %__MODULE__{parent: String.t() | nil}

  defstruct [:parent]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [parent: :string]
  end
end
