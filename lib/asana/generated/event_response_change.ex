defmodule Asana.Generated.EventResponseChange do
  @moduledoc """
  Provides struct and type for a EventResponseChange
  """

  @type t :: %__MODULE__{
          action: String.t() | nil,
          added_value: map | nil,
          field: String.t() | nil,
          new_value: map | nil,
          removed_value: map | nil
        }

  defstruct [:action, :added_value, :field, :new_value, :removed_value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action: :string, added_value: :map, field: :string, new_value: :map, removed_value: :map]
  end
end
