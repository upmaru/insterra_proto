defmodule Insterra.Protos.Blueprints.Stack.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :provider_name, 1, type: :string
end

defmodule Insterra.Protos.Blueprints.Stack do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: :int32
  field :name, 2, type: :string
  field :presets, 3, repeated: true, type: Insterra.Protos.Blueprints.Preset
end

defmodule Insterra.Protos.Blueprints.Preset.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :category_ids, 1, repeated: true, type: :int32
end

defmodule Insterra.Protos.Blueprints.Preset do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: :int32
  field :name, 2, type: :string
  field :attributes, 3, type: :bytes
  field :block, 4, type: Insterra.Protos.Descriptors.Block
end

defmodule Insterra.Protos.Blueprints.Handler.Service do
  @moduledoc false

  use GRPC.Service,
    name: "insterra.protos.blueprints.Handler",
    protoc_gen_elixir_version: "0.12.0"

  rpc :ListStacks,
      Insterra.Protos.Blueprints.Stack.ListRequest,
      stream(Insterra.Protos.Blueprints.Stack)

  rpc :ListPresets,
      Insterra.Protos.Blueprints.Preset.ListRequest,
      stream(Insterra.Protos.Blueprints.Preset)
end

defmodule Insterra.Protos.Blueprints.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Blueprints.Handler.Service
end