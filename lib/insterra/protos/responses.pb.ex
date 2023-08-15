defmodule Insterra.Protos.Responses.Code do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :OK, 0
  field :NOT_FOUND, 1
end

defmodule Insterra.Protos.Responses.Status do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :code, 1, type: Insterra.Protos.Responses.Code, enum: true
  field :message, 2, type: :string
end