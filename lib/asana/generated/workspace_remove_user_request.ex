defmodule Asana.Generated.WorkspaceRemoveUserRequest do
  @moduledoc """
  Provides struct and type for a WorkspaceRemoveUserRequest
  """

  @type t :: %__MODULE__{user: String.t() | nil}

  defstruct [:user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [user: :string]
  end
end
