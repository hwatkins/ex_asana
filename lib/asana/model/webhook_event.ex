# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.WebhookEvent do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"action",
    :"created_at",
    :"parent",
    :"resource",
    :"type",
    :"user"
  ]

  @type t :: %__MODULE__{
    :"action" => String.t | nil,
    :"created_at" => DateTime.t | nil,
    :"parent" => integer() | nil,
    :"resource" => integer() | nil,
    :"type" => String.t | nil,
    :"user" => integer() | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.WebhookEvent do
  def decode(value, _options) do
    value
  end
end

