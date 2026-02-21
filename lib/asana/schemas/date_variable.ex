defmodule Asana.DateVariable do
  @moduledoc """
  Provides struct and type for a DateVariable
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:__info__, :description, :gid, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [description: :string, gid: :string, name: :string]
  end
end
