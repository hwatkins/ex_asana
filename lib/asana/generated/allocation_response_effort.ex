defmodule Asana.Generated.AllocationResponseEffort do
  @moduledoc """
  Provides struct and type for a AllocationResponseEffort
  """

  @type t :: %__MODULE__{type: String.t() | nil, value: number | nil}

  defstruct [:type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["hours", "percent"]}, value: :number]
  end
end
