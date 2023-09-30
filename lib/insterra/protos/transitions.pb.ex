defmodule Insterra.Protos.Transitions.Event do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:comment, 2, type: :string)
end
