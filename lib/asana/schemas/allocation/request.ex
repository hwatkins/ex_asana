defmodule Asana.Allocation.Request do
  @moduledoc """
  Provides struct and type for a Allocation.Request
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          assignee: String.t() | nil,
          effort: map | nil,
          end_date: Date.t() | nil,
          gid: String.t() | nil,
          parent: String.t() | nil,
          resource_type: String.t() | nil,
          start_date: Date.t() | nil
        }

  defstruct [:__info__, :assignee, :effort, :end_date, :gid, :parent, :resource_type, :start_date]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignee: :string,
      effort: :map,
      end_date: {:string, "date"},
      gid: :string,
      parent: :string,
      resource_type: :string,
      start_date: {:string, "date"}
    ]
  end
end
