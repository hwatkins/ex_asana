defmodule Asana.User.TaskList do
  @moduledoc """
  Provides struct and type for a User.TaskList
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          gid: String.t() | nil,
          name: String.t() | nil,
          owner: Asana.User.TaskListOwner.response() | nil,
          resource_type: String.t() | nil,
          workspace: Asana.User.TaskListWorkspace.response() | nil
        }

  defstruct [:__info__, :gid, :name, :owner, :resource_type, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      gid: :string,
      name: :string,
      owner: {Asana.User.TaskListOwner, :response},
      resource_type: :string,
      workspace: {Asana.User.TaskListWorkspace, :response}
    ]
  end
end
