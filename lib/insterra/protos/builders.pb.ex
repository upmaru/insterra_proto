defmodule Insterra.Protos.Builders.Preview.Block.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:dependencies, 0)
  field(:stack, 1)
  field(:build, 2)
  field(:run, 3)
  field(:hook, 4)
  field(:kits, 5)
end

defmodule Insterra.Protos.Builders.Pack.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:template, 0)
  field(:extension, 1)
  field(:builder, 2)
end

defmodule Insterra.Protos.Builders.Pack.Requirement.Condition do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:must, 0)
  field(:one_of, 1)
end

defmodule Insterra.Protos.Builders.Dependency do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:pack_id, 2, type: :int32)
  field(:package_id, 3, type: :int32)
end

defmodule Insterra.Protos.Builders.Preview.CreateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:pack_id, 2, type: :int32)
  field(:deployment_endpoint, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Preview.File do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:path, 1, type: :string)
  field(:description, 2, type: :string)
  field(:content, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Preview.Block do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:section, 1, type: Insterra.Protos.Builders.Preview.Block.Type, enum: true)
  field(:description, 2, type: :string)
  field(:content, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Preview.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Builders.Preview)
end

defmodule Insterra.Protos.Builders.Preview do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:pack_id, 1, type: :int32)
  field(:blocks, 2, repeated: true, type: Insterra.Protos.Builders.Preview.Block)
  field(:files, 3, repeated: true, type: Insterra.Protos.Builders.Preview.File)
end

defmodule Insterra.Protos.Builders.Pack.Requirement do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:pack_id, 1, type: :int32, json_name: "packId")

  field(:pack_type, 2, type: Insterra.Protos.Builders.Pack.Type, json_name: "packType", enum: true)

  field(:condition, 3, type: Insterra.Protos.Builders.Pack.Requirement.Condition, enum: true)
  field(:service, 4, type: :string)
end

defmodule Insterra.Protos.Builders.Pack.TransitionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:id, 3, type: :int32)
  field(:event, 4, type: Insterra.Protos.Transitions.Event)
  field(:encrypted_token, 5, type: Insterra.Protos.Credentials.Token)
  field(:deployment_endpoint, 6, type: :string)
end

defmodule Insterra.Protos.Builders.Pack.GetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:instellar_package_id, 2, type: :int32)
  field(:type, 3, type: Insterra.Protos.Builders.Pack.Type, enum: true)
end

defmodule Insterra.Protos.Builders.Pack.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:organization_name, 2, type: :string)
  field(:visibility, 3, type: :string)
  field(:parent_id, 4, type: :int32)
  field(:type, 5, type: Insterra.Protos.Builders.Pack.Type, enum: true)
  field(:ids, 6, repeated: true, type: :int32)
end

defmodule Insterra.Protos.Builders.Pack.CreateOrUpdateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:instellar_package_id, 3, type: :int32)
  field(:parent_id, 4, type: :int32)
  field(:image_id, 5, type: :int32)
  field(:addon_ids, 6, repeated: true, type: :int32)
  field(:name, 7, type: :string)
  field(:type, 8, type: Insterra.Protos.Builders.Pack.Type, enum: true)
end

defmodule Insterra.Protos.Builders.Pack.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Builders.Pack)
end

defmodule Insterra.Protos.Builders.Pack.Event do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:inserted_at, 3, type: :string)
  field(:resource, 4, type: Insterra.Protos.Builders.Pack)
end

defmodule Insterra.Protos.Builders.Pack do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Builders.Pack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:current_state, 4, type: :string)
  field(:visibility, 5, type: :string)
  field(:description, 6, type: :string)
  field(:tags, 7, repeated: true, type: Insterra.Protos.Taxonomies.Tag)
  field(:main_dependency, 8, type: Insterra.Protos.Builders.Dependency)
  field(:image_id, 9, type: :int32)
  field(:parent_id, 10, type: :int32)
  field(:addon_ids, 11, repeated: true, type: :int32)
  field(:required_extension_ids, 12, repeated: true, type: :int32)
  field(:requirements, 13, repeated: true, type: Insterra.Protos.Builders.Pack.Requirement)
end

defmodule Insterra.Protos.Builders.Image do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:system, 2, type: :string)
  field(:version, 3, type: :string)
end

defmodule Insterra.Protos.Builders.Package.Repository do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:channel, 2, type: :string)
  field(:architecture, 3, type: :string)
  field(:image, 4, type: Insterra.Protos.Builders.Image)
end

defmodule Insterra.Protos.Builders.Package.Version.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:package_id, 1, type: :int32)
end

defmodule Insterra.Protos.Builders.Package.Version do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:identifier, 2, type: :string)
  field(:package, 3, type: Insterra.Protos.Builders.Package)
  field(:repository, 4, type: Insterra.Protos.Builders.Package.Repository)
end

defmodule Insterra.Protos.Builders.Package do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

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
    :TransitionPack,
    Insterra.Protos.Builders.Pack.TransitionRequest,
    Insterra.Protos.Builders.Pack.Response
  )

  rpc(
    :CreatePackPreview,
    Insterra.Protos.Builders.Preview.CreateRequest,
    Insterra.Protos.Builders.Preview.Response
  )

  rpc(
    :CreateOrUpdateChildPack,
    Insterra.Protos.Builders.Pack.CreateOrUpdateRequest,
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
