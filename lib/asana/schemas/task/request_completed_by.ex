defmodule Asana.Task.RequestCompletedBy do
  @moduledoc """
  Provides struct and type for a Task.RequestCompletedBy
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :gid, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [gid: :string, name: :string, resource_type: :string]
  end
end
