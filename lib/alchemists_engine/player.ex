defmodule AlchemistsEngine.Player do
  alias AlchemistsEngine.Player
  defstruct [:state, :name]

  use Fsmx.Struct, fsm: AlchemistsEngine.PlayerLifecycle

  def build(name) do
    {:ok, %Player{name: name, state: "floating"}}
  end
end
