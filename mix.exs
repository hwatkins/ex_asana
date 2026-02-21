defmodule Asana.MixProject do
  use Mix.Project

  @version "0.6.0"
  @source_url "https://github.com/hwatkins/ex_asana"

  def project do
    [
      app: :asana,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: "Interface for interacting with the Asana Platform REST API from Elixir.",
      deps: deps(),
      docs: docs(),
      source_url: @source_url
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:req, "~> 0.5"},
      {:oapi_generator, "~> 0.4.0", only: :dev, runtime: false},
      {:yaml_elixir, "~> 2.9", only: :dev, runtime: false},
      {:ex_doc, "~> 0.37", only: :dev, runtime: false},
      {:plug, "~> 1.16", only: :test}
    ]
  end

  defp package do
    [
      name: "asana",
      files: ~w(lib config mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end
end
