# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.DependentArrayData do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"dependents"
  ]

  @type t :: %__MODULE__{
    :"dependents" => [integer()] | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.DependentArrayData do
  def decode(value, _options) do
    value
  end
end
