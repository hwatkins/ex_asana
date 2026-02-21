defmodule Asana.Generated.UserTaskListCompact do
  @moduledoc """
  Provides struct and type for a UserTaskListCompact
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: Asana.Generated.UserTaskListCompactOwner.t() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.Generated.UserTaskListCompactWorkspace.t() | nil
        }

  defstruct [:gid, :name, :owner, :resource_type, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      name: :string,
      owner: {Asana.Generated.UserTaskListCompactOwner, :t},
      resource_type: :string,
      workspace: {Asana.Generated.UserTaskListCompactWorkspace, :t}
    ]
  end
end
