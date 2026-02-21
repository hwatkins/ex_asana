defmodule Asana.ModifyDependentsRequest do
  @moduledoc """
  Provides struct and type for a ModifyDependentsRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, dependents: [String.t()] | nil}

  defstruct [:__info__, :dependents]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dependents: [:string]]
  end
end
