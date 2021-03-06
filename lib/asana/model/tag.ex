# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule Asana.Model.Tag do
  @moduledoc """
  A *tag* is a label that can be attached to any task in Asana. It exists in a single workspace or organization.  Tags have some metadata associated with them, but it is possible that we will simplify them in the future so it is not encouraged to rely too heavily on it. Unlike projects, tags do not provide any ordering on the tasks they are associated with.
  """

  @derive [Poison.Encoder]
  defstruct [
    :"followers",
    :"name",
    :"color",
    :"workspace",
    :"id",
    :"gid",
    :"resource_type",
    :"created_at"
  ]

  @type t :: %__MODULE__{
    :"followers" => [Asana.Model.User.t] | nil,
    :"name" => String.t | nil,
    :"color" => String.t | nil,
    :"workspace" => Asana.Model.WorkspaceCompact.t | nil,
    :"id" => integer() | nil,
    :"gid" => integer() | nil,
    :"resource_type" => String.t | nil,
    :"created_at" => DateTime.t | nil
  }
end

defimpl Poison.Decoder, for: Asana.Model.Tag do
  import Asana.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"followers", :list, Asana.Model.User, options)
    |> deserialize(:"workspace", :struct, Asana.Model.WorkspaceCompact, options)
  end
end

