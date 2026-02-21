%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/", "mix.exs", "config/"],
        excluded: [~r"/lib/asana/generated/"]
      },
      plugins: [],
      requires: [],
      strict: true,
      color: true
    }
  ]
}
