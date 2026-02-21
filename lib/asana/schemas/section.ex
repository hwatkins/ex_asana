defmodule Asana.Section do
  @moduledoc """
  Provides struct and types for a Section
  """
  use Asana.Encoder

  @type compact :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  @type response :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          project: Asana.Project.compact() | nil,
          projects: [Asana.Project.compact()] | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :created_at, :gid, :name, :project, :projects, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:compact) do
    [gid: :string, name: :string, resource_type: :string]
  end

  def __fields__(:response) do
    [
      created_at: {:string, "date-time"},
      gid: :string,
      name: :string,
      project: {Asana.Project, :compact},
      projects: [{Asana.Project, :compact}],
      resource_type: :string
    ]
  end
end
