defmodule Insterra.Protos.Blueprints.Component.Type do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:dependency, 0)
  field(:inferred, 1)
end

defmodule Insterra.Protos.Blueprints.Stack.Type do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:template, 0)
  field(:blueprint, 1)
end

defmodule Insterra.Protos.Blueprints.Draft do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:stack_id, 3, type: :int32)
  field(:original, 4, type: :bool)
end

defmodule Insterra.Protos.Blueprints.HydratedBlock do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:uid, 3, type: :string)
  field(:component_id, 4, type: :int32)
  field(:component_type, 5, type: Insterra.Protos.Blueprints.Component.Type, enum: true)
  field(:component_parent_id, 6, type: :int32)
  field(:attributes, 7, type: :bytes)
end

defmodule Insterra.Protos.Blueprints.Archive.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 3, type: Insterra.Protos.Blueprints.Archive)
end

defmodule Insterra.Protos.Blueprints.Archive.File do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:name, 1, type: :string)
  field(:content, 2, type: :string)
end

defmodule Insterra.Protos.Blueprints.Archive do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :string)
  field(:files, 2, repeated: true, type: Insterra.Protos.Blueprints.Archive.File)
end

defmodule Insterra.Protos.Blueprints.Component.ListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:stack_id, 2, type: :int32)
end

defmodule Insterra.Protos.Blueprints.Component.UpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:id, 3, type: :int32)
  field(:attributes, 4, type: :bytes)
end

defmodule Insterra.Protos.Blueprints.Component.Reference.CreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:component_id, 3, type: :int32)
  field(:provider, 4, type: :string)
  field(:type, 5, type: :string)
  field(:uid, 6, type: :string)
end

defmodule Insterra.Protos.Blueprints.Component.Reference.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Blueprints.Component.Reference)
end

defmodule Insterra.Protos.Blueprints.Component.Reference do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:provider, 2, type: :string)
  field(:type, 3, type: :string)
  field(:uid, 4, type: :string)
  field(:component_id, 5, type: :int32)
end

defmodule Insterra.Protos.Blueprints.Component.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Blueprints.Component)
end

defmodule Insterra.Protos.Blueprints.Component.Event do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:inserted_at, 3, type: :string)
  field(:resource, 4, type: Insterra.Protos.Blueprints.Component)
end

defmodule Insterra.Protos.Blueprints.Component do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:stack_id, 2, type: :int32)
  field(:type, 3, type: Insterra.Protos.Blueprints.Component.Type, enum: true)
  field(:attributes, 4, type: :bytes)
  field(:preset_id, 5, type: :int32)
  field(:preset, 6, type: Insterra.Protos.Blueprints.Preset)
  field(:parent_id, 7, type: :int32)
  field(:current_state, 8, type: :string)
  field(:registration, 9, type: :string)
  field(:reference, 10, type: Insterra.Protos.Blueprints.Component.Reference)
  field(:updated_at, 11, type: :string)
end

defmodule Insterra.Protos.Blueprints.ComponentParams do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:uid, 2, type: :string)
  field(:preset_id, 3, type: :int32)
  field(:attributes, 4, type: :bytes)
  field(:children, 5, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
end

defmodule Insterra.Protos.Blueprints.Stack.TransitionRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:id, 3, type: :int32)
  field(:event, 4, type: Insterra.Protos.Transitions.Event)
end

defmodule Insterra.Protos.Blueprints.Stack.GetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:type, 2, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:id, 3, type: :int32)
end

defmodule Insterra.Protos.Blueprints.Stack.ListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:organization_name, 2, type: :string)
  field(:visibility, 3, type: :string)
  field(:type, 4, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
end

defmodule Insterra.Protos.Blueprints.Stack.CreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:type, 3, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 4, type: :string)
  field(:description, 5, type: :string)
  field(:parent_id, 6, type: :int32)
  field(:components, 7, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
end

defmodule Insterra.Protos.Blueprints.Stack.UpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:organization_reference, 1, type: Insterra.Protos.Accounts.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Accounts.UserReference)
  field(:id, 3, type: :int32)
  field(:type, 4, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 5, type: :string)
  field(:description, 6, type: :string)
  field(:components, 7, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
end

defmodule Insterra.Protos.Blueprints.Stack.Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Blueprints.Stack)
end

defmodule Insterra.Protos.Blueprints.Stack do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:current_state, 5, type: :string, json_name: "currentState")
  field(:possible_events, 6, repeated: true, type: :string)
  field(:description, 7, type: :string)
  field(:components, 8, repeated: true, type: Insterra.Protos.Blueprints.Component)
end

defmodule Insterra.Protos.Blueprints.Preset.ListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:category_ids, 1, repeated: true, type: :int32)
end

defmodule Insterra.Protos.Blueprints.Preset do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:id, 1, type: :int32)
  field(:name, 2, type: :string)
  field(:provider, 3, type: Insterra.Protos.Platforms.Provider)
  field(:require_one_of_preset_ids, 4, repeated: true, type: :int32)
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
    :PrepareConfiguration,
    Insterra.Protos.Blueprints.Draft,
    stream(Insterra.Protos.Blueprints.HydratedBlock)
  )

  rpc(
    :CreateConfiguration,
    Insterra.Protos.Blueprints.Draft,
    Insterra.Protos.Blueprints.Archive.Response
  )

  rpc(
    :GetStack,
    Insterra.Protos.Blueprints.Stack.GetRequest,
    Insterra.Protos.Blueprints.Stack.Response
  )

  rpc(
    :TransitionStack,
    Insterra.Protos.Blueprints.Stack.TransitionRequest,
    Insterra.Protos.Blueprints.Stack.Response
  )

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
    :UpdateStack,
    Insterra.Protos.Blueprints.Stack.UpdateRequest,
    Insterra.Protos.Blueprints.Stack.Response
  )

  rpc(
    :ListPresets,
    Insterra.Protos.Blueprints.Preset.ListRequest,
    stream(Insterra.Protos.Blueprints.Preset)
  )

  rpc(
    :ListComponents,
    Insterra.Protos.Blueprints.Component.ListRequest,
    stream(Insterra.Protos.Blueprints.Component)
  )

  rpc(
    :UpdateComponent,
    Insterra.Protos.Blueprints.Component.UpdateRequest,
    Insterra.Protos.Blueprints.Component.Response
  )

  rpc(
    :CreateComponentReference,
    Insterra.Protos.Blueprints.Component.Reference.CreateRequest,
    Insterra.Protos.Blueprints.Component.Reference.Response
  )
end

defmodule Insterra.Protos.Blueprints.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Blueprints.Handler.Service
end
