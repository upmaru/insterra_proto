defmodule Insterra.Protos.Blueprints.Component.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:dependency, 0)
  field(:inferred, 1)
end

defmodule Insterra.Protos.Blueprints.Stack.Type do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:template, 0)
  field(:blueprint, 1)
end

defmodule Insterra.Protos.Blueprints.OrganizationReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Blueprints.Component.UpdateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Blueprints.OrganizationReference)
  field(:id, 2, type: :int32)
  field(:attributes, 3, type: :bytes)
end

defmodule Insterra.Protos.Blueprints.Component.Response do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:status, 1, type: Insterra.Protos.Responses.Status)
  field(:data, 2, type: Insterra.Protos.Blueprints.Component)
end

defmodule Insterra.Protos.Blueprints.Component do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:type, 2, type: Insterra.Protos.Blueprints.Component.Type, enum: true)
  field(:attributes, 3, type: :bytes)
  field(:preset_id, 4, type: :int32, json_name: "presetId")
  field(:preset, 5, type: Insterra.Protos.Blueprints.Preset)
  field(:parent_id, 6, type: :int32, json_name: "parentId")
end

defmodule Insterra.Protos.Blueprints.ComponentParams do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:id, 1, type: :int32)
  field(:uid, 2, type: :string)
  field(:preset_id, 3, type: :int32, json_name: "presetId")
  field(:attributes, 4, type: :bytes)
  field(:children, 5, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
end

defmodule Insterra.Protos.Blueprints.Stack.TransitionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Blueprints.OrganizationReference)
  field(:user_reference, 2, type: Insterra.Protos.Blueprints.Stack.UserReference)
  field(:id, 3, type: :int32)
  field(:event, 4, type: Insterra.Protos.Transitions.Event)
end

defmodule Insterra.Protos.Blueprints.Stack.GetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Blueprints.OrganizationReference)
  field(:type, 2, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:id, 3, type: :int32)
end

defmodule Insterra.Protos.Blueprints.Stack.ListRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Blueprints.OrganizationReference)
  field(:organization_name, 2, type: :string)
  field(:visibility, 3, type: :string)
  field(:type, 4, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
end

defmodule Insterra.Protos.Blueprints.Stack.UserReference do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:provider, 1, type: :string)
  field(:uid, 2, type: :string)
end

defmodule Insterra.Protos.Blueprints.Stack.CreateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Blueprints.OrganizationReference)
  field(:type, 2, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 3, type: :string)
  field(:description, 4, type: :string)
  field(:parent_id, 5, type: :int32, json_name: "parentId")
  field(:components, 6, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
end

defmodule Insterra.Protos.Blueprints.Stack.UpdateRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.12.0", syntax: :proto3

  field(:organization_reference, 1, type: Insterra.Protos.Blueprints.OrganizationReference)
  field(:id, 2, type: :int32)
  field(:type, 3, type: Insterra.Protos.Blueprints.Stack.Type, enum: true)
  field(:name, 4, type: :string)
  field(:description, 5, type: :string)
  field(:components, 6, repeated: true, type: Insterra.Protos.Blueprints.ComponentParams)
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
  field(:current_state, 5, type: :string, json_name: "currentState")
  field(:possible_events, 6, repeated: true, type: :string, json_name: "possibleEvents")
  field(:description, 7, type: :string)
  field(:components, 8, repeated: true, type: Insterra.Protos.Blueprints.Component)
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
    :UpdateComponent,
    Insterra.Protos.Blueprints.Component.UpdateRequest,
    Insterra.Protos.Blueprints.Component.Response
  )
end

defmodule Insterra.Protos.Blueprints.Handler.Stub do
  @moduledoc false

  use GRPC.Stub, service: Insterra.Protos.Blueprints.Handler.Service
end
