defmodule Asana.User.UpdateRequest do
  @moduledoc """
  Provides struct and type for a User.UpdateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          custom_fields: map | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :custom_fields, :gid, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [custom_fields: :map, gid: :string, name: :string, resource_type: :string]
  end
end
