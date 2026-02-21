defmodule Asana.Generated.CustomFieldSettingResponse do
  @moduledoc """
  Provides struct and type for a CustomFieldSettingResponse
  """

  @type t :: %__MODULE__{
          custom_field: Asana.Generated.CustomFieldSettingResponseCustomField.t() | nil,
          gid: String.t() | nil,
          is_important: boolean | nil,
          parent: Asana.Generated.CustomFieldSettingResponseParent.t() | nil,
          project: Asana.Generated.CustomFieldSettingResponseProject.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:custom_field, :gid, :is_important, :parent, :project, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_field: {Asana.Generated.CustomFieldSettingResponseCustomField, :t},
      gid: :string,
      is_important: :boolean,
      parent: {Asana.Generated.CustomFieldSettingResponseParent, :t},
      project: {Asana.Generated.CustomFieldSettingResponseProject, :t},
      resource_type: :string
    ]
  end
end
