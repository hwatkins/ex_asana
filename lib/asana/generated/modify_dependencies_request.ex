defmodule Asana.Generated.ModifyDependenciesRequest do
  @moduledoc """
  Provides struct and type for a ModifyDependenciesRequest
  """

  @type t :: %__MODULE__{dependencies: [String.t()] | nil}

  defstruct [:dependencies]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dependencies: [:string]]
  end
end
