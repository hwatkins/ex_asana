defmodule Asana.Webhook.Request do
  @moduledoc """
  Provides struct and type for a Webhook.Request
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          filters: [Asana.Webhook.RequestFilters.t()] | nil,
          resource: String.t(),
          target: String.t()
        }

  defstruct [:__info__, :filters, :resource, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filters: [{Asana.Webhook.RequestFilters, :t}], resource: :string, target: {:string, "uri"}]
  end
end
