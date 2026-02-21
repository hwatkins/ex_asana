defmodule Asana.AddMembersRequest do
  @moduledoc """
  Provides struct and type for a AddMembersRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, members: String.t()}

  defstruct [:__info__, :members]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [members: :string]
  end
end
