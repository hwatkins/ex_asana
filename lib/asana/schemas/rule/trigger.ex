defmodule Asana.Rule.Trigger do
  @moduledoc """
  Provides struct and type for a Rule.Trigger
  """
  use Asana.Encoder

  @type response :: %__MODULE__{__info__: map, message: String.t() | nil}

  defstruct [:__info__, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [message: :string]
  end
end
