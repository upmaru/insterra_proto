defmodule Insterra.Proto.Blueprints.Stack.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider_name, 1, type: :string)
end

defmodule Insterra.Proto.Blueprints.Stack do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:presets, 3, repeated: true, type: Insterra.Proto.Blueprints.Preset)
end

defmodule Insterra.Proto.Blueprints.Preset.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:category_ids, 1, type: :string)
end

defmodule Insterra.Proto.Blueprints.Preset do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:block, 3, type: Insterra.Proto.Descriptors.Block)
end

defmodule Insterra.Proto.Blueprints.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.proto.blueprints.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListStacks,
    Insterra.Proto.Blueprints.Stack.ListRequest,
    stream(Insterra.Proto.Blueprints.Stack)
  )

  rpc(
    :ListPresets,
    Insterra.Proto.Blueprints.Preset.ListRequest,
    stream(Insterra.Proto.Blueprints.Preset)
  )
end

defmodule Insterra.Proto.Blueprints.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Proto.Blueprints.Handler.Service
end
