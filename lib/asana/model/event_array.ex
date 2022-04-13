# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.EventArray do
  @moduledoc """
  The full record for all events that have occurred since the sync token was created.
  """

  @derive [Poison.Encoder]
  defstruct [
    :"data",
    :"sync"
  ]

  @type t :: %__MODULE__{
    :"data" => [Asana.Model.Event.t] | nil,
    :"sync" => String.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.EventArray do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"data", :list, Asana.Model.Event, options)
  end
end
