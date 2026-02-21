defmodule Asana.Generated.AddFollowersRequest do
  @moduledoc """
  Provides struct and type for a AddFollowersRequest
  """

  @type t :: %__MODULE__{followers: String.t()}

  defstruct [:followers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [followers: :string]
  end
end
