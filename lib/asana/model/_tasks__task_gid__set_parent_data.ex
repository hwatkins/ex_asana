# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.TasksTaskGidSetParentData do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"parent",
    :"insert_after",
    :"insert_before"
  ]

  @type t :: %__MODULE__{
    :"parent" => integer(),
    :"insert_after" => integer() | nil,
    :"insert_before" => integer() | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.TasksTaskGidSetParentData do
  def decode(value, _options) do
    value
  end
end

