defmodule Asana.Batch.Request do
  @moduledoc """
  Provides struct and type for a Batch.Request
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, actions: [Asana.Batch.RequestAction.t()] | nil}

  defstruct [:__info__, :actions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [actions: [{Asana.Batch.RequestAction, :t}]]
  end
end
