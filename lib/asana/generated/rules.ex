defmodule Asana.Generated.Rules do
  @moduledoc """
  Provides API endpoint related to rules
  """

  @default_client Asana.OperationClient

  @type trigger_rule_200_json_resp :: %{data: Asana.Generated.RuleTriggerResponse.t() | nil}

  @doc """
  Trigger a rule

  Trigger a rule which uses an ["incoming web request"](/docs/incoming-web-requests) trigger.

  ## Request Body

  **Content Types**: `application/json`

  A dictionary of variables accessible from within the rule.
  """
  @spec trigger_rule(rule_trigger_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Generated.Rules.trigger_rule_200_json_resp()}
          | {:error, Asana.Generated.ErrorResponse.t()}
  def trigger_rule(rule_trigger_gid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [rule_trigger_gid: rule_trigger_gid, body: body],
      call: {Asana.Generated.Rules, :trigger_rule},
      url: "/rule_triggers/#{rule_trigger_gid}/run",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Generated.Rules, :trigger_rule_200_json_resp}},
        {400, {Asana.Generated.ErrorResponse, :t}},
        {401, {Asana.Generated.ErrorResponse, :t}},
        {402, {Asana.Generated.ErrorResponse, :t}},
        {403, {Asana.Generated.ErrorResponse, :t}},
        {404, {Asana.Generated.ErrorResponse, :t}},
        {500, {Asana.Generated.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:trigger_rule_200_json_resp) do
    [data: {Asana.Generated.RuleTriggerResponse, :t}]
  end
end
