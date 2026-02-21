defmodule Asana.Task.RemoveFollowersRequest do
  @moduledoc """
  Provides struct and type for a Task.RemoveFollowersRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, followers: [String.t()]}

  defstruct [:__info__, :followers]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [followers: [:string]]
  end
end
