defmodule HipcallSdkTest do
  use ExUnit.Case
  doctest HipcallSdk

  test "greets the world" do
    assert HipcallSdk.hello() == :world
  end
end
