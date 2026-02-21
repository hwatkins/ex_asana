defmodule Asana.CustomField.Setting do
  @moduledoc """
  Provides struct and type for a CustomField.Setting
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          custom_field: Asana.CustomField.SettingCustomField.response() | nil,
          gid: String.t() | nil,
          is_important: boolean | nil,
          parent: Asana.CustomField.SettingParent.response() | nil,
          project: Asana.CustomField.SettingProject.response() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :custom_field, :gid, :is_important, :parent, :project, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      custom_field: {Asana.CustomField.SettingCustomField, :response},
      gid: :string,
      is_important: :boolean,
      parent: {Asana.CustomField.SettingParent, :response},
      project: {Asana.CustomField.SettingProject, :response},
      resource_type: :string
    ]
  end
end
