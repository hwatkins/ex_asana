defmodule Asana.Generated.WebhookRequestFilters do
  @moduledoc """
  Provides struct and type for a WebhookRequestFilters
  """

  @type t :: %__MODULE__{
          action: String.t() | nil,
          fields: [String.t()] | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:action, :fields, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action: :string, fields: [:string], resource_subtype: :string, resource_type: :string]
  end
end
