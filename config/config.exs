import Config

if config_env() == :dev do
  config :oapi_generator,
    default: [
      output: [
        base_module: Asana.Generated,
        location: "lib/asana/generated",
        default_client: Asana.OperationClient
      ],
      naming: [
        default_operation_module: Operations
      ]
    ]
end
