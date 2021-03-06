# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.TagObject do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"data"
  ]

  @type t :: %__MODULE__{
    :"data" => Asana.Model.Tag.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.TagObject do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"data", :struct, Asana.Model.Tag, options)
  end
end

