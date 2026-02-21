defmodule Asana.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_asana,
      version: "0.1.0",
      description: description(),
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/hwatkins/ex_asana",
      homepage_url: "https://github.com/hwatkins/ex_asana",
      package: package(),
      deps: deps(),
      aliases: aliases(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:req, "~> 0.5"},
      {:plug, "~> 1.15", only: :test},
      {:oapi_generator, "~> 0.4", only: :dev, runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    "Elixir client for Asana API with stream pagination and typed convenience wrappers."
  end

  defp package do
    [
      files: ~w(lib guides priv/openapi README.md CHANGELOG.md LICENSE mix.exs),
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/hwatkins/ex_asana"
      }
    ]
  end

  defp aliases do
    [
      {:"api.flatten.asana",
       "asana.flatten_spec priv/openapi/asana.yaml --output priv/openapi/asana_flat.json"},
      {:"api.gen.asana", ["api.flatten.asana", "api.gen default priv/openapi/asana_flat.json"]},
      {:"api.refresh.asana", "asana.refresh_spec"},
      {:ci,
       [
         "deps.get",
         "compile --warnings-as-errors",
         "format --check-formatted",
         "cmd MIX_ENV=test mix test",
         "credo --strict",
         "dialyzer"
       ]},
      {:"ci.fast",
       [
         "deps.get",
         "compile --warnings-as-errors",
         "format --check-formatted",
         "cmd MIX_ENV=test mix test",
         "credo --strict"
       ]}
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "priv/plts",
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
      plt_add_apps: [:mix],
      ignore_warnings: ".dialyzer_ignore.exs"
    ]
  end
end
