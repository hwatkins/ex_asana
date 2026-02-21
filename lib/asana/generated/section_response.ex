defmodule Asana.Generated.SectionResponse do
  @moduledoc """
  Provides struct and type for a SectionResponse
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          project: Asana.Generated.ProjectCompact.t() | nil,
          projects: [Asana.Generated.ProjectCompact.t()] | nil,
          resource_type: String.t() | nil
        }

  defstruct [:created_at, :gid, :name, :project, :projects, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      gid: :string,
      name: :string,
      project: {Asana.Generated.ProjectCompact, :t},
      projects: [{Asana.Generated.ProjectCompact, :t}],
      resource_type: :string
    ]
  end
end
