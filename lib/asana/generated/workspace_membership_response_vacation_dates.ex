defmodule Asana.Generated.WorkspaceMembershipResponseVacationDates do
  @moduledoc """
  Provides struct and type for a WorkspaceMembershipResponseVacationDates
  """

  @type t :: %__MODULE__{end_on: String.t() | nil, start_on: String.t() | nil}

  defstruct [:end_on, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [end_on: :string, start_on: :string]
  end
end
