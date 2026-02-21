defmodule Asana.AuditLogEvent.Details do
  @moduledoc """
  Provides struct and type for a AuditLogEvent.Details
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          group: map | nil,
          new_value: String.t() | nil,
          old_value: String.t() | nil,
          saml_response: String.t() | nil
        }

  defstruct [:__info__, :group, :new_value, :old_value, :saml_response]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [group: :map, new_value: :string, old_value: :string, saml_response: :string]
  end
end
