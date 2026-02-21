defmodule Asana.Portfolio.CurrentStatusUpdate do
  @moduledoc """
  Provides struct and type for a Portfolio.CurrentStatusUpdate
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:__info__, :gid, :resource_subtype, :resource_type, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      gid: :string,
      resource_subtype:
        {:enum, ["project_status_update", "portfolio_status_update", "goal_status_update"]},
      resource_type: :string,
      title: :string
    ]
  end
end
