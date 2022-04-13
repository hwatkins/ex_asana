# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.BatchRequest do
  @moduledoc """
  A request object for use in a batch request.
  """

  @derive [Poison.Encoder]
  defstruct [
    :"relative_path",
    :"method",
    :"data",
    :"options"
  ]

  @type t :: %__MODULE__{
    :"relative_path" => String.t,
    :"method" => String.t,
    :"data" => map() | nil,
    :"options" => Asana.Model.BatchRequestOptions.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.BatchRequest do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"options", :struct, Asana.Model.BatchRequestOptions, options)
  end
end
