defmodule Asana.ResourceExportRequestParameter do
  @moduledoc """
  Provides struct and type for a ResourceExportRequestParameter
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          fields: [String.t()] | nil,
          filters: Asana.ResourceExportFilters.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :fields, :filters, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fields: [:string], filters: {Asana.ResourceExportFilters, :t}, resource_type: :string]
  end
end
