defmodule Asana.Workspace.MembershipVacationDates do
  @moduledoc """
  Provides struct and type for a Workspace.MembershipVacationDates
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          end_on: String.t() | nil,
          start_on: String.t() | nil
        }

  defstruct [:__info__, :end_on, :start_on]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [end_on: :string, start_on: :string]
  end
end
