# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.InlineObject13 do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"data"
  ]

  @type t :: %__MODULE__{
    :"data" => Asana.Model.TasksTaskGidRemoveProjectData.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.InlineObject13 do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"data", :struct, Asana.Model.TasksTaskGidRemoveProjectData, options)
  end
end
