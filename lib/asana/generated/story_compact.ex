defmodule Asana.Generated.StoryCompact do
  @moduledoc """
  Provides struct and type for a StoryCompact
  """

  @type t :: %__MODULE__{
          created_at: DateTime.t() | nil,
          created_by: Asana.Generated.UserCompact.t() | nil,
          gid: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil,
          text: String.t() | nil
        }

  defstruct [:created_at, :created_by, :gid, :resource_subtype, :resource_type, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, "date-time"},
      created_by: {Asana.Generated.UserCompact, :t},
      gid: :string,
      resource_subtype: :string,
      resource_type: :string,
      text: :string
    ]
  end
end
