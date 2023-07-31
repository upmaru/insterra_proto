defmodule Insterra.Proto.Descriptors.Block do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: :string)
  field(:category, 3, type: Insterra.Proto.Taxonomies.Category)
end
