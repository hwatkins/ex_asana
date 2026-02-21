defmodule Asana.Project.SectionInsertRequest do
  @moduledoc """
  Provides struct and type for a Project.SectionInsertRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          after_section: String.t() | nil,
          before_section: String.t() | nil,
          section: String.t()
        }

  defstruct [:__info__, :after_section, :before_section, :section]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [after_section: :string, before_section: :string, section: :string]
  end
end
