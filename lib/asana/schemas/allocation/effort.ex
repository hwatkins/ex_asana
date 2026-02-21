defmodule Asana.Allocation.Effort do
  @moduledoc """
  Provides struct and type for a Allocation.Effort
  """
  use Asana.Encoder

  @type response :: %__MODULE__{__info__: map, type: String.t() | nil, value: number | nil}

  defstruct [:__info__, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [type: {:enum, ["hours", "percent"]}, value: :number]
  end
end
