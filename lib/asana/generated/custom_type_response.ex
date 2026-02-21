defmodule Asana.Generated.CustomTypeResponse do
  @moduledoc """
  Provides struct and type for a CustomTypeResponse
  """

  @type t :: %__MODULE__{
          gid: String.t() | nil,
          name: String.t() | nil,
          resource_type: String.t() | nil,
          status_options: [Asana.Generated.CustomTypeStatusOptionResponse.t()] | nil
        }

  defstruct [:gid, :name, :resource_type, :status_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gid: :string,
      name: :string,
      resource_type: :string,
      status_options: [{Asana.Generated.CustomTypeStatusOptionResponse, :t}]
    ]
  end
end
