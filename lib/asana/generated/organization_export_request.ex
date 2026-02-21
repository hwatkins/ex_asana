defmodule Asana.Generated.OrganizationExportRequest do
  @moduledoc """
  Provides struct and type for a OrganizationExportRequest
  """

  @type t :: %__MODULE__{organization: String.t() | nil}

  defstruct [:organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: :string]
  end
end
