defmodule Asana.Generated.ModifyDependentsRequest do
  @moduledoc """
  Provides struct and type for a ModifyDependentsRequest
  """

  @type t :: %__MODULE__{dependents: [String.t()] | nil}

  defstruct [:dependents]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dependents: [:string]]
  end
end
