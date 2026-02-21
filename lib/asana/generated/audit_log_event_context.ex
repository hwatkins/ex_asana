defmodule Asana.Generated.AuditLogEventContext do
  @moduledoc """
  Provides struct and type for a AuditLogEventContext
  """

  @type t :: %__MODULE__{
          api_authentication_method: String.t() | nil,
          client_ip_address: String.t() | nil,
          context_type: String.t() | nil,
          oauth_app_name: String.t() | nil,
          on_behalf_of_user_id: integer | nil,
          rule_name: String.t() | nil,
          user_agent: String.t() | nil
        }

  defstruct [
    :api_authentication_method,
    :client_ip_address,
    :context_type,
    :oauth_app_name,
    :on_behalf_of_user_id,
    :rule_name,
    :user_agent
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_authentication_method:
        {:enum, ["cookie", "oauth", "personal_access_token", "service_account"]},
      client_ip_address: :string,
      context_type:
        {:enum, ["web", "desktop", "mobile", "asana_support", "asana", "email", "api"]},
      oauth_app_name: :string,
      on_behalf_of_user_id: :integer,
      rule_name: :string,
      user_agent: :string
    ]
  end
end
