defmodule AlchemistsEngine.Game do
  alias AlchemistsEngine.Game
  defstruct [:state, :name]

  use Fsmx.Struct, fsm: AlchemistsEngine.Lifecycle

  def create(name) do
    %Game{name: name, state: "creating"}
  end
end
