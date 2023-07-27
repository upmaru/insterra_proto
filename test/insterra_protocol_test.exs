defmodule InsterraProtocolTest do
  use ExUnit.Case
  doctest InsterraProtocol

  test "greets the world" do
    assert InsterraProtocol.hello() == :world
  end
end
