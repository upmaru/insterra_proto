defmodule Insterra.Proto.Platforms.Provider do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: :int32
  field :name, 2, type: :string
  field :source, 3, type: :string
  field :version, 4, type: :string
end