defmodule Asana.Generated.AccessRequestResponse do
  @moduledoc """
  Provides struct and type for a AccessRequestResponse
  """

  @type t :: %__MODULE__{
          approval_status: String.t() | nil,
          gid: String.t() | nil,
          message: String.t() | nil,
          requester: Asana.Generated.UserCompact.t() | nil,
          resource_type: String.t() | nil,
          target: Asana.Generated.AccessRequestTargetIdCompact.t() | nil
        }

  defstruct [:approval_status, :gid, :message, :requester, :resource_type, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approval_status: {:enum, ["pending", "approved", "denied"]},
      gid: :string,
      message: :string,
      requester: {Asana.Generated.UserCompact, :t},
      resource_type: :string,
      target: {Asana.Generated.AccessRequestTargetIdCompact, :t}
    ]
  end
end
