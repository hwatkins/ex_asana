defmodule Asana.Generated.AuditLogEventResource do
  @moduledoc """
  Provides struct and type for a AuditLogEventResource
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_subtype: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:email, :gid, :name, :resource_subtype, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: :string,
      gid: :string,
      name: :string,
      resource_subtype: :string,
      resource_type: :string
    ]
  end
end
