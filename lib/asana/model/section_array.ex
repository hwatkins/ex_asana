# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.SectionArray do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"data"
  ]

  @type t :: %__MODULE__{
    :"data" => [Asana.Model.Section.t] | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.SectionArray do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"data", :list, Asana.Model.Section, options)
  end
end
