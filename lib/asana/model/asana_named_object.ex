# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.AsanaNamedObject do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"name",
    :"id",
    :"gid",
    :"resource_type"
  ]

  @type t :: %__MODULE__{
    :"name" => String.t | nil,
    :"id" => integer() | nil,
    :"gid" => integer() | nil,
    :"resource_type" => String.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.AsanaNamedObject do
  def decode(value, _options) do
    value
  end
end

