defmodule Insterra.Embeds.Behaviour do
  @callback editable_fields :: [atom]
  @callback sequence :: atom | nil
end
