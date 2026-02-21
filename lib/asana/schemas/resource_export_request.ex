defmodule Asana.ResourceExportRequest do
  @moduledoc """
  Provides struct and type for a ResourceExportRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          export_request_parameters: [Asana.ResourceExportRequestParameter.t()] | nil,
          workspace: String.t() | nil
        }

  defstruct [:__info__, :export_request_parameters, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [export_request_parameters: [{Asana.ResourceExportRequestParameter, :t}], workspace: :string]
  end
end
