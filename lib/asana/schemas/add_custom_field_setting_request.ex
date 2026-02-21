defmodule Asana.AddCustomFieldSettingRequest do
  @moduledoc """
  Provides struct and type for a AddCustomFieldSettingRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          custom_field: Asana.CustomField.CreateRequest.t() | String.t(),
          insert_after: String.t() | nil,
          insert_before: String.t() | nil,
          is_important: boolean | nil
        }

  defstruct [:__info__, :custom_field, :insert_after, :insert_before, :is_important]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_field: {:union, [:string, {Asana.CustomField.CreateRequest, :t}]},
      insert_after: :string,
      insert_before: :string,
      is_important: :boolean
    ]
  end
end
