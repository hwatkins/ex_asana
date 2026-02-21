defmodule Asana.Generated.AddCustomFieldSettingRequest do
  @moduledoc """
  Provides struct and type for a AddCustomFieldSettingRequest
  """

  @type t :: %__MODULE__{
          custom_field: Asana.Generated.CustomFieldCreateRequest.t() | String.t(),
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          is_important: boolean | nil
        }

  defstruct [:custom_field, :insert_after, :insert_before, :is_important]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_field: {:union, [:string, {Asana.Generated.CustomFieldCreateRequest, :t}]},
      insert_after: :string,
      insert_before: :string,
      is_important: :boolean
    ]
  end
end
