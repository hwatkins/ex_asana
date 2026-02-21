defmodule Asana.Generated.AuditLogEventActor do
  @moduledoc """
  Provides struct and type for a AuditLogEventActor
  """

  @type t :: %__MODULE__{
          actor_type: String.t() | nil,
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:actor_type, :email, :gid, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor_type:
        {:enum, ["user", "asana", "asana_support", "anonymous", "external_administrator"]},
      email: :string,
      gid: :string,
      name: :string
    ]
  end
end
