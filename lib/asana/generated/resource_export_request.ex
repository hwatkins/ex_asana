defmodule Asana.Generated.ResourceExportRequest do
  @moduledoc """
  Provides struct and type for a ResourceExportRequest
  """

  @type t :: %__MODULE__{
          export_request_parameters: [Asana.Generated.ResourceExportRequestParameter.t()] | nil,
          workspace: String.t() | nil
        }

  defstruct [:export_request_parameters, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      export_request_parameters: [{Asana.Generated.ResourceExportRequestParameter, :t}],
      workspace: :string
    ]
  end
end
