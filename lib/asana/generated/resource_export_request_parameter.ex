defmodule Asana.Generated.ResourceExportRequestParameter do
  @moduledoc """
  Provides struct and type for a ResourceExportRequestParameter
  """

  @type t :: %__MODULE__{
          fields: [String.t()] | nil,
          filters: Asana.Generated.ResourceExportFilters.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:fields, :filters, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      fields: [:string],
      filters: {Asana.Generated.ResourceExportFilters, :t},
      resource_type: :string
    ]
  end
end
