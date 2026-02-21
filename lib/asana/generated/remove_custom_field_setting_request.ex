defmodule Asana.Generated.RemoveCustomFieldSettingRequest do
  @moduledoc """
  Provides struct and type for a RemoveCustomFieldSettingRequest
  """

  @type t :: %__MODULE__{custom_field: String.t()}

  defstruct [:custom_field]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [custom_field: :string]
  end
end
