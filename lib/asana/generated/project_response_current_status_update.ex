defmodule Asana.Generated.ProjectResponseCurrentStatusUpdate do
  @moduledoc """
  Provides struct and type for a ProjectResponseCurrentStatusUpdate
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:gid, :resource_subtype, :resource_type, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      resource_subtype:
        {:enum, ["project_status_update", "portfolio_status_update", "goal_status_update"]},
      resource_type: :string,
      title: :string
    ]
  end
end
