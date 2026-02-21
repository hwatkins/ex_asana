defmodule Asana.Generated.ResourceExportFilters do
  @moduledoc """
  Provides struct and type for a ResourceExportFilters
  """

  @type t :: %__MODULE__{
          "assigned_by.any": [String.t()] | nil,
          "assignee.any": [String.t()] | nil,
          "commented_on_by.any": [String.t()] | nil,
          "created_at.after": DateTime.t() | nil,
          "created_at.before": DateTime.t() | nil,
          "created_by.any": [String.t()] | nil,
          "followers.any": [String.t()] | nil,
          "liked_by.any": [String.t()] | nil,
          "modified_at.after": DateTime.t() | nil,
          "modified_at.before": DateTime.t() | nil
        }

  defstruct [
    :"assigned_by.any",
    :"assignee.any",
    :"commented_on_by.any",
    :"created_at.after",
    :"created_at.before",
    :"created_by.any",
    :"followers.any",
    :"liked_by.any",
    :"modified_at.after",
    :"modified_at.before"
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "assigned_by.any": [:string],
      "assignee.any": [:string],
      "commented_on_by.any": [:string],
      "created_at.after": {:string, "date-time"},
      "created_at.before": {:string, "date-time"},
      "created_by.any": [:string],
      "followers.any": [:string],
      "liked_by.any": [:string],
      "modified_at.after": {:string, "date-time"},
      "modified_at.before": {:string, "date-time"}
    ]
  end
end
