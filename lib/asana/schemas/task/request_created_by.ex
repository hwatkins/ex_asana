defmodule Asana.Task.RequestCreatedBy do
  @moduledoc """
  Provides struct and type for a Task.RequestCreatedBy
  """
  use Asana.Encoder

  @type t :: %__MODULE__{__info__: map, gid: String.t() | nil, resource_type: String.t() | nil}

  defstruct [:__info__, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, resource_type: :string]
  end
end
