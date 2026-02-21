defmodule Asana.Task.CreatedBy do
  @moduledoc """
  Provides struct and type for a Task.CreatedBy
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [gid: :string, resource_type: :string]
  end
end
