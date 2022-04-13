# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.TaskCompact do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"id",
    :"gid",
    :"resource_type"
  ]

  @type t :: %__MODULE__{
    :"id" => integer() | nil,
    :"gid" => integer() | nil,
    :"resource_type" => String.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.TaskCompact do
  def decode(value, _options) do
    value
  end
end
