defmodule Insterra.Proto.Platforms.Provider.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :query, 1, type: :string
end

defmodule Insterra.Proto.Platforms.Provider do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field :id, 1, type: :int32
  field :name, 2, type: :string
  field :source, 3, type: :string
  field :version, 4, type: :string
end

defmodule Insterra.Proto.Platforms.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.proto.platforms.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc :ListProviders,
      Insterra.Proto.Platforms.Provider.ListRequest,
      stream(Insterra.Proto.Platforms.Provider)
end

defmodule Insterra.Proto.Platforms.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Proto.Platforms.Handler.Service
end