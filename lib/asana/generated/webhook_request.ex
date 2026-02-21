defmodule Asana.Generated.WebhookRequest do
  @moduledoc """
  Provides struct and type for a WebhookRequest
  """

  @type t :: %__MODULE__{
          filters: [Asana.Generated.WebhookRequestFilters.t()] | nil,
          resource: String.t(),
          target: String.t()
        }

  defstruct [:filters, :resource, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      filters: [{Asana.Generated.WebhookRequestFilters, :t}],
      resource: :string,
      target: {:string, "uri"}
    ]
  end
end
