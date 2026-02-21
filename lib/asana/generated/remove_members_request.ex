defmodule Asana.Generated.RemoveMembersRequest do
  @moduledoc """
  Provides struct and type for a RemoveMembersRequest
  """

  @type t :: %__MODULE__{members: String.t()}

  defstruct [:members]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [members: :string]
  end
end
