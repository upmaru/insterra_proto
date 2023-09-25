defmodule Insterra.Protos.Builders.Pack.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:template, 0)
  field(:builder, 1)
end

defmodule Insterra.Protos.Builders.Pack.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:organization_name, 2, type: :string)
  field(:visibility, 3, type: :string)
  field(:type, 4, type: Insterra.Protos.Builders.Pack.Type, enum: true)
end

defmodule Insterra.Protos.Builders.Pack do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Builders.Pack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:visibility, 4, type: :string)
  field(:description, 5, type: :string)
  field(:tags, 6, repeated: true, type: Insterra.Protos.Taxonomies.Tag)
end

defmodule Insterra.Protos.Builders.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.protos.builders.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListPacks,
    Insterra.Protos.Builders.Pack.ListRequest,
    stream(Insterra.Protos.Builders.Pack)
  )
end

defmodule Insterra.Protos.Builders.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Builders.Handler.Service
end
