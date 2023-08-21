defmodule Insterra.Protos.Blueprints.Stack.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:template, 0)
  field(:blueprint, 1)
end

defmodule Insterra.Protos.Blueprints.Component do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:attributes, 2, type: :bytes)
  field(:preset, 3, type: Insterra.Protos.Blueprints.Preset)
end

defmodule Insterra.Protos.Blueprints.ComponentParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :string)
  field(:preset_id, 2, type: :int32, json_name: "presetId")
  field(:attributes, 3, type: :bytes)
end

defmodule Insterra.Protos.Blueprints.Stack.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:visibility, 1, type: :string)
  field(:type, 2, type: :string)
  field(:organization_name, 3, type: :string)
end

defmodule Insterra.Protos.Blueprints.Stack.OrganizationReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Blueprints.Stack.CreateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1,
    type: Insterra.Protos.Blueprints.Stack.OrganizationReference,
    json_name: "organizationReference"
  )

  field(:type, 2, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:description, 4, type: :string)
  field(:components, 5, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
end

defmodule Insterra.Protos.Blueprints.Stack.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Blueprints.Stack)
end

defmodule Insterra.Protos.Blueprints.Stack do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:description, 4, type: :string)
  field(:components, 5, repeated: true, type: Insterra.Protos.Blueprints.Component)
end

defmodule Insterra.Protos.Blueprints.Preset.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:category_ids, 1, repeated: true, type: :int32)
end

defmodule Insterra.Protos.Blueprints.Preset do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:provider, 3, type: Insterra.Protos.Platforms.Provider)

  field(:require_one_of_preset_ids, 4,
    repeated: true,
    type: :int32,
    json_name: "requireOneOfPresetIds"
  )

  field(:attributes, 5, type: :bytes)
  field(:tags, 6, repeated: true, type: Insterra.Protos.Taxonomies.Tag)
  field(:block, 7, type: Insterra.Protos.Descriptors.Block)
end

defmodule Insterra.Protos.Blueprints.Handler.Service do
  @moduledoc false

  use GRPC.Service,
    name: "insterra.protos.blueprints.Handler",
    protoc_gen_elixir_version: "0.12.0"

  rpc(
    :ListStacks,
    Insterra.Protos.Blueprints.Stack.ListRequest,
    stream(Insterra.Protos.Blueprints.Stack)
  )

  rpc(
    :CreateStack,
    Insterra.Protos.Blueprints.Stack.CreateRequest,
    Insterra.Protos.Blueprints.Stack.Response
  )

  rpc(
    :ListPresets,
    Insterra.Protos.Blueprints.Preset.ListRequest,
    stream(Insterra.Protos.Blueprints.Preset)
  )
end

defmodule Insterra.Protos.Blueprints.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Blueprints.Handler.Service
end
