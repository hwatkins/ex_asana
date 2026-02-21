defmodule Asana.Project.SaveAsTemplateRequest do
  @moduledoc """
  Provides struct and type for a Project.SaveAsTemplateRequest
  """
  use Asana.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          name: String.t(),
          public: boolean,
          team: String.t() | nil,
          workspace: String.t() | nil
        }

  defstruct [:__info__, :name, :public, :team, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string, public: :boolean, team: :string, workspace: :string]
  end
end
