defmodule Asana.Generated.CustomFieldCompact do
  @moduledoc """
  Provides struct and type for a CustomFieldCompact
  """

  @type t :: %__MODULE__{
          date_value: Asana.Generated.CustomFieldCompactDateValue.t() | nil,
          display_value: String.t() | nil,
          enabled: boolean | nil,
          enum_options: [Asana.Generated.EnumOption.t()] | nil,
          enum_value: Asana.Generated.CustomFieldCompactEnumValue.t() | nil,
          gid: String.t() | nil,
          id_prefix: String.t() | nil,
          input_restrictions: [String.t()] | nil,
          is_formula_field: boolean | nil,
          multi_enum_values: [Asana.Generated.EnumOption.t()] | nil,
          name: String.t() | nil,
          number_value: number | nil,
          representation_type: String.t() | nil,
          resource_type: String.t() | nil,
          text_value: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [
    :date_value,
    :display_value,
    :enabled,
    :enum_options,
    :enum_value,
    :gid,
    :id_prefix,
    :input_restrictions,
    :is_formula_field,
    :multi_enum_values,
    :name,
    :number_value,
    :representation_type,
    :resource_type,
    :text_value,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      date_value: {Asana.Generated.CustomFieldCompactDateValue, :t},
      display_value: :string,
      enabled: :boolean,
      enum_options: [{Asana.Generated.EnumOption, :t}],
      enum_value: {Asana.Generated.CustomFieldCompactEnumValue, :t},
      gid: :string,
      id_prefix: :string,
      input_restrictions: [:string],
      is_formula_field: :boolean,
      multi_enum_values: [{Asana.Generated.EnumOption, :t}],
      name: :string,
      number_value: :number,
      representation_type:
        {:enum,
         ["text", "enum", "multi_enum", "number", "date", "people", "formula", "custom_id"]},
      resource_type: :string,
      text_value: :string,
      type: {:enum, ["text", "enum", "multi_enum", "number", "date", "people"]}
    ]
  end
end
