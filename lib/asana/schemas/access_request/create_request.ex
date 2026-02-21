defmodule Asana.AccessRequest.CreateRequest do
  @moduledoc """
  Provides struct and type for a AccessRequest.CreateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, message: String.t() | nil, target: String.t()}

  defstruct [:__info__, :message, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, target: :string]
  end
end
