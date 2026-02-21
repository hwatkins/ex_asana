defmodule Asana.Encoder do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      @derive {JSON.Encoder, except: [:__info__]}
    end
  end
end
