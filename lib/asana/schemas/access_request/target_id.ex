defmodule Asana.AccessRequest.TargetId do
  @moduledoc """
  Provides struct and type for a AccessRequest.TargetId
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, resource_type: :string]
  end
end
