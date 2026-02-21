defmodule Asana.Generated.AccessRequestCreateRequest do
  @moduledoc """
  Provides struct and type for a AccessRequestCreateRequest
  """

  @type t :: %__MODULE__{message: String.t() | nil, target: String.t()}

  defstruct [:message, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, target: :string]
  end
end
