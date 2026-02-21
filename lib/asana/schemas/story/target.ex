defmodule Asana.Story.Target do
  @moduledoc """
  Provides struct and type for a Story.Target
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          created_by: map | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :created_by, :gid, :name, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      created_by: :map,
      gid: :string,
      name: :string,
      resource_subtype: {:enum, ["default_task", "milestone", "approval", "custom"]},
      resource_type: :string
    ]
  end
end
