defmodule Asana.Generated.JobCompactNewTask do
  @moduledoc """
  Provides struct and type for a JobCompactNewTask
  """

  @type t :: %__MODULE__{
          created_by: map | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:created_by, :gid, :name, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_by: :map,
      gid: :string,
      name: :string,
      resource_subtype: {:enum, ["default_task", "milestone", "approval", "custom"]},
      resource_type: :string
    ]
  end
end
