import Config

if config_env() == :dev do
  config :oapi_generator,
    default: [
      naming: [
        group: [
          AccessRequest,
          Allocation,
          Attachment,
          AuditLogEvent,
          Batch,
          Budget,
          CustomField,
          CustomFieldMembership,
          CustomFieldSetting,
          CustomType,
          CustomTypeMembership,
          CustomTypeStatusOption,
          DateVariable,
          EnumOption,
          Event,
          Goal,
          GoalMembership,
          GoalMetric,
          GoalRelationship,
          Job,
          Membership,
          PortfolioMembership,
          Portfolio,
          ProjectBrief,
          ProjectMembership,
          ProjectStatus,
          ProjectTemplate,
          Project,
          Rate,
          Reaction,
          Role,
          Rule,
          RuleTrigger,
          Section,
          StatusUpdate,
          Story,
          Tag,
          TaskTemplate,
          TaskTemplateRecipe,
          Task,
          TeamMembership,
          Team,
          TemplateRole,
          TimePeriod,
          TimeTrackingEntry,
          UserTaskList,
          User,
          Webhook,
          WorkspaceMembership,
          Workspace
        ],
        merge: [
          {~r/Compact$/, ""},
          {~r/Base$/, ""},
          {~r/Response$/, ""}
        ],
        rename: [
          {~r/^DeprecatedPortfolioMembership/, "PortfolioMembership"}
        ]
      ],
      output: [
        base_module: Asana,
        extra_fields: [__info__: :map],
        location: "lib/",
        operation_subdirectory: "asana/operations/",
        schema_subdirectory: "asana/schemas/",
        schema_use: Asana.Encoder,
        default_client: Asana.Client,
        types: [
          error: {Asana.Error, :t}
        ]
      ]
    ]
end
