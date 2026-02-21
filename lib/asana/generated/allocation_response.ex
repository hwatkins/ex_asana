defmodule Asana.Generated.AllocationResponse do
  @moduledoc """
  Provides struct and type for a AllocationResponse
  """

  @type t :: %__MODULE__{
          assignee: Asana.Generated.AllocationResponseAssignee.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          effort: Asana.Generated.AllocationResponseEffort.t() | nil,
          end_date: Date.t() | nil,
          gid: String.t() | nil,
          parent: Asana.Generated.ProjectCompact.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          start_date: Date.t() | nil
        }

  defstruct [
    :assignee,
    :created_by,
    :effort,
    :end_date,
    :gid,
    :parent,
    :resource_subtype,
    :resource_type,
    :start_date
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignee: {Asana.Generated.AllocationResponseAssignee, :t},
      created_by: {Asana.Generated.UserCompact, :t},
      effort: {Asana.Generated.AllocationResponseEffort, :t},
      end_date: {:string, "date"},
      gid: :string,
      parent: {Asana.Generated.ProjectCompact, :t},
      resource_subtype: :string,
      resource_type: :string,
      start_date: {:string, "date"}
    ]
  end
end
