# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.CustomFieldSettings do
  @moduledoc """
  Custom fields are attached to a particular project with the Custom Field Settings resource. This resource both represents the many-to-many join of the Custom Field and Project as well as stores information that is relevant to that particular pairing; for instance, the `is_important` property determines some possible application-specific handling of that custom field.
  """

  @derive [Poison.Encoder]
  defstruct [
    :"is_important",
    :"parent",
    :"project",
    :"custom_field",
    :"id",
    :"gid",
    :"resource_type",
    :"created_at"
  ]

  @type t :: %__MODULE__{
    :"is_important" => boolean() | nil,
    :"parent" => ProjectCompact | nil,
    :"project" => ProjectCompact | nil,
    :"custom_field" => CustomField | nil,
    :"id" => integer() | nil,
    :"gid" => integer() | nil,
    :"resource_type" => String.t | nil,
    :"created_at" => DateTime.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.CustomFieldSettings do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"parent", :struct, Asana.Model.ProjectCompact, options)
    |> deserialize(:"project", :struct, Asana.Model.ProjectCompact, options)
    |> deserialize(:"custom_field", :struct, Asana.Model.CustomField, options)
  end
end
