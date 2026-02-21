defmodule Asana.Generated.EnumOptionInsertRequest do
  @moduledoc """
  Provides struct and type for a EnumOptionInsertRequest
  """

  @type t :: %__MODULE__{
          after_enum_option: String.t() | nil,
          before_enum_option: String.t() | nil,
          enum_option: String.t()
        }

  defstruct [:after_enum_option, :before_enum_option, :enum_option]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [after_enum_option: :string, before_enum_option: :string, enum_option: :string]
  end
end
