defmodule Asana.ModifyDependenciesRequest do
  @moduledoc """
  Provides struct and type for a ModifyDependenciesRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, dependencies: [String.t()] | nil}

  defstruct [:__info__, :dependencies]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dependencies: [:string]]
  end
end
