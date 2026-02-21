defmodule Asana.AccessRequest do
  @moduledoc """
  Provides struct and type for a AccessRequest
  """
  use Asana.Encoder

  @type response :: %__MODULE__{
          __info__: map,
          approval_status: String.t() | nil,
          gid: String.t() | nil,
          message: String.t() | nil,
          requester: Asana.User.compact() | nil,
          resource_type: String.t() | nil,
          target: Asana.AccessRequest.TargetId.compact() | nil
        }

  defstruct [:__info__, :approval_status, :gid, :message, :requester, :resource_type, :target]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:response) do
    [
      approval_status: {:enum, ["pending", "approved", "denied"]},
      gid: :string,
      message: :string,
      requester: {Asana.User, :compact},
      resource_type: :string,
      target: {Asana.AccessRequest.TargetId, :compact}
    ]
  end
end
