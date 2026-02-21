defmodule Asana.Generated.BatchRequestActionOptions do
  @moduledoc """
  Provides struct and type for a BatchRequestActionOptions
  """

  @type t :: %__MODULE__{fields: [String.t()] | nil, limit: integer | nil, offset: integer | nil}

  defstruct [:fields, :limit, :offset]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fields: [:string], limit: :integer, offset: :integer]
  end
end
