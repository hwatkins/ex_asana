defmodule Asana.OrganizationExportRequest do
  @moduledoc """
  Provides struct and type for a OrganizationExportRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, organization: String.t() | nil}

  defstruct [:__info__, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: :string]
  end
end
