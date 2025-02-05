defmodule AlchemistsEngineTest do
  use ExUnit.Case
  doctest AlchemistsEngine

  test "greets the world" do
    assert AlchemistsEngine.hello() == :world
  end
end
