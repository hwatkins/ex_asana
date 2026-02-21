defmodule Asana.Webhook.UpdateRequest do
  @moduledoc """
  Provides struct and type for a Webhook.UpdateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, filters: [Asana.Webhook.UpdateRequestFilters.t()] | nil}

  defstruct [:__info__, :filters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filters: [{Asana.Webhook.UpdateRequestFilters, :t}]]
  end
end
