defmodule Asana.Goal.MetricCurrentValueRequest do
  @moduledoc """
  Provides struct and type for a Goal.MetricCurrentValueRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          current_number_value: number | nil,
          gid: String.t() | nil,
          resource_type: String.t() | nil
        }

  defstruct [:__info__, :current_number_value, :gid, :resource_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [current_number_value: :number, gid: :string, resource_type: :string]
  end
end
