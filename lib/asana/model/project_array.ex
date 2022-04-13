# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.ProjectArray do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"data"
  ]

  @type t :: %__MODULE__{
    :"data" => [Asana.Model.Project.t] | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.ProjectArray do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"data", :list, Asana.Model.Project, options)
  end
end

