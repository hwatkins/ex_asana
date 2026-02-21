defmodule Asana.Generated.BatchResponse do
  @moduledoc """
  Provides struct and type for a BatchResponse
  """

  @type t :: %__MODULE__{body: map | nil, headers: map | nil, status_code: integer | nil}

  defstruct [:body, :headers, :status_code]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [body: :map, headers: :map, status_code: :integer]
  end
end
