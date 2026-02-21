defmodule Asana.RemoveCustomFieldSettingRequest do
  @moduledoc """
  Provides struct and type for a RemoveCustomFieldSettingRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, custom_field: String.t()}

  defstruct [:__info__, :custom_field]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [custom_field: :string]
  end
end
