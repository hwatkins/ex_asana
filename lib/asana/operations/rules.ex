defmodule Asana.Rules do
  @moduledoc """
  Provides API endpoint related to rules
  """

  @default_client Asana.Client

  @type trigger_rule_200_json_resp :: %{__info__: map, data: Asana.Rule.Trigger.response() | nil}

  @doc """
  Trigger a rule

  Trigger a rule which uses an ["incoming web request"](/docs/incoming-web-requests) trigger.

  ## Request Body

  **Content Types**: `application/json`

  A dictionary of variables accessible from within the rule.
  """
  @spec trigger_rule(rule_trigger_gid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Asana.Rules.trigger_rule_200_json_resp()} | {:error, Asana.Error.t()}
  def trigger_rule(rule_trigger_gid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [rule_trigger_gid: rule_trigger_gid, body: body],
      call: {Asana.Rules, :trigger_rule},
      url: "/rule_triggers/#{rule_trigger_gid}/run",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Asana.Rules, :trigger_rule_200_json_resp}},
        {400, {Asana.Error, :response}},
        {401, {Asana.Error, :response}},
        {402, {Asana.Error, :response}},
        {403, {Asana.Error, :response}},
        {404, {Asana.Error, :response}},
        {500, {Asana.Error, :response}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:trigger_rule_200_json_resp) do
    [data: {Asana.Rule.Trigger, :response}]
  end
end
