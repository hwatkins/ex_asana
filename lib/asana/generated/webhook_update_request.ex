defmodule Asana.Generated.WebhookUpdateRequest do
  @moduledoc """
  Provides struct and type for a WebhookUpdateRequest
  """

  @type t :: %__MODULE__{filters: [Asana.Generated.WebhookUpdateRequestFilters.t()] | nil}

  defstruct [:filters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filters: [{Asana.Generated.WebhookUpdateRequestFilters, :t}]]
  end
end
