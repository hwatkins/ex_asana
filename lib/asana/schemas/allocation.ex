defmodule Asana.Allocation do
  @moduledoc """
  Provides struct and type for a Allocation
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          assignee: Asana.Allocation.Assignee.response() | nil,
          created_by: Asana.User.compact() | nil,
          effort: Asana.Allocation.Effort.response() | nil,
          end_date: Date.t() | nil,
          gid: String.t() | nil,
          parent: Asana.Project.compact() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          start_date: Date.t() | nil
        }

  defstruct [
    :__info__,
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
  def __fields__(:response) do
    [
      assignee: {Asana.Allocation.Assignee, :response},
      created_by: {Asana.User, :compact},
      effort: {Asana.Allocation.Effort, :response},
      end_date: {:string, "date"},
      gid: :string,
      parent: {Asana.Project, :compact},
      resource_subtype: :string,
      resource_type: :string,
      start_date: {:string, "date"}
    ]
  end
end
