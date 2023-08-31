defmodule Insterra.Embeds.Behaviour do
  @callback editable_fields :: [atom]
  @callback new_params(Keyword.t()) :: map
end
