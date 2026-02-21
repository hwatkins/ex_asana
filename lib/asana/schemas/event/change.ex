defmodule Asana.Event.Change do
  @moduledoc """
  Provides struct and type for a Event.Change
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          action: String.t() | nil,
          added_value: map | nil,
          field: String.t() | nil,
          new_value: map | nil,
          removed_value: map | nil
        }

  defstruct [:__info__, :action, :added_value, :field, :new_value, :removed_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [action: :string, added_value: :map, field: :string, new_value: :map, removed_value: :map]
  end
end
