defmodule Insterra.Protos.Builders.Preview.Block.Type do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:dependencies, 0)
  field(:stack, 1)
  field(:build, 2)
  field(:run, 3)
  field(:hook, 4)
  field(:kits, 5)
end

defmodule Insterra.Protos.Builders.Pack.Type do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:template, 0)
  field(:builder, 1)
end

defmodule Insterra.Protos.Builders.Dependency do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:pack_id, 2, type: :int32)
  field(:package_id, 3, type: :int32)
end

defmodule Insterra.Protos.Builders.Preview.CreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:pack_id, 2, type: :int32)
  field(:deployment_endpoint, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Preview.Block do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:section, 1, type: Insterra.Protos.Builders.Preview.Block.Type, enum: true)
  field(:description, 2, type: :string)
  field(:content, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Preview.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Builders.Preview)
end

defmodule Insterra.Protos.Builders.Preview do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:pack_id, 1, type: :int32)
  field(:blocks, 2, repeated: true, type: Insterra.Protos.Builders.Preview.Block)
end

defmodule Insterra.Protos.Builders.Pack.GetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:instellar_package_id, 2, type: :int32)
  field(:type, 3, type: Insterra.Protos.Builders.Pack.Type, enum: true)
end

defmodule Insterra.Protos.Builders.Pack.ListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:organization_name, 2, type: :string)
  field(:visibility, 3, type: :string)
  field(:type, 4, type: Insterra.Protos.Builders.Pack.Type, enum: true)
end

defmodule Insterra.Protos.Builders.Pack.CreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:instellar_package_id, 2, type: :int32)
  field(:parent_id, 3, type: :int32)
  field(:image_id, 4, type: :int32)
  field(:name, 5, type: :string)
  field(:type, 7, type: Insterra.Protos.Builders.Pack.Type, enum: true)
end

defmodule Insterra.Protos.Builders.Pack.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Builders.Pack)
end

defmodule Insterra.Protos.Builders.Pack do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Builders.Pack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:visibility, 4, type: :string)
  field(:description, 5, type: :string)
  field(:tags, 6, repeated: true, type: Insterra.Protos.Taxonomies.Tag)
  field(:main_dependency, 7, type: Insterra.Protos.Builders.Dependency)
end

defmodule Insterra.Protos.Builders.Image do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:system, 2, type: :string)
  field(:version, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Package.Repository do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:channel, 2, type: :string)
  field(:architecture, 3, type: :string)
  field(:image, 4, type: Insterra.Protos.Builders.Image)
end

defmodule Insterra.Protos.Builders.Package.Version.ListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:package_id, 1, type: :int32)
end

defmodule Insterra.Protos.Builders.Package.Version do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:identifier, 2, type: :string)
  field(:package, 3, type: Insterra.Protos.Builders.Package)
  field(:repository, 4, type: Insterra.Protos.Builders.Package.Repository)
end

defmodule Insterra.Protos.Builders.Package do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
end

defmodule Insterra.Protos.Builders.Handler.Service do
  @moduledoc false

  use GRPC.Service, name: "insterra.protos.builders.Handler", protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListPacks,
    Insterra.Protos.Builders.Pack.ListRequest,
    stream(Insterra.Protos.Builders.Pack)
  )

  rpc(:GetPack, Insterra.Protos.Builders.Pack.GetRequest, Insterra.Protos.Builders.Pack.Response)

  rpc(
    :CreatePackPreview,
    Insterra.Protos.Builders.Preview.CreateRequest,
    Insterra.Protos.Builders.Preview.Response
  )

  rpc(
    :CreateChildPack,
    Insterra.Protos.Builders.Pack.CreateRequest,
    Insterra.Protos.Builders.Pack.Response
  )

  rpc(
    :ListPackageVersions,
    Insterra.Protos.Builders.Package.Version.ListRequest,
    stream(Insterra.Protos.Builders.Package.Version)
  )
end

defmodule Insterra.Protos.Builders.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Builders.Handler.Service
end
