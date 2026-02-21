defmodule Asana.Generated.WorkspaceResponse do
  @moduledoc """
  Provides struct and type for a WorkspaceResponse
  """

  @type t :: %__MODULE__{
          email_domains: [String.t()] | nil,
          gid: String.t() | nil,
          is_organization: boolean | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:email_domains, :gid, :is_organization, :name, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email_domains: [string: "uri"],
      gid: :string,
      is_organization: :boolean,
      name: :string,
      resource_type: :string
    ]
  end
end
