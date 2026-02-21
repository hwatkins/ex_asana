defmodule Asana.Generated.UserTaskListResponse do
  @moduledoc """
  Provides struct and type for a UserTaskListResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: Asana.Generated.UserTaskListResponseOwner.t() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.Generated.UserTaskListResponseWorkspace.t() | nil
        }

  defstruct [:gid, :name, :owner, :resource_type, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      name: :string,
      owner: {Asana.Generated.UserTaskListResponseOwner, :t},
      resource_type: :string,
      workspace: {Asana.Generated.UserTaskListResponseWorkspace, :t}
    ]
  end
end
