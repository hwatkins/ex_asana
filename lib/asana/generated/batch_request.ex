defmodule Asana.Generated.BatchRequest do
  @moduledoc """
  Provides struct and type for a BatchRequest
  """

  @type t :: %__MODULE__{actions: [Asana.Generated.BatchRequestAction.t()] | nil}

  defstruct [:actions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [actions: [{Asana.Generated.BatchRequestAction, :t}]]
  end
end
