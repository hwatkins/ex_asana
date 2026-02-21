defmodule Asana.Generated.AuditLogEventDetails do
  @moduledoc """
  Provides struct and type for a AuditLogEventDetails
  """

  @type t :: %__MODULE__{
          group: map | nil,
          new_value: String.t() | nil,
          old_value: String.t() | nil,
          saml_response: String.t() | nil
        }

  defstruct [:group, :new_value, :old_value, :saml_response]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [group: :map, new_value: :string, old_value: :string, saml_response: :string]
  end
end
