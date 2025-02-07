defmodule AlchemistsEngine.Game do
  alias AlchemistsEngine.Game
  defstruct [:state, :name, players: [], adventurers: []]

  use Fsmx.Struct, fsm: AlchemistsEngine.GameLifecycle

  def build(name) do
    {:ok, %Game{name: name, state: "created"}}
  end

  @spec add_player(%Game{}, %AlchemistsEngine.Player{}) :: {:ok, %Game{}} | {:error, any()}
  def add_player(game, player) do
    with {:ok, game} <- Fsmx.transition(game, "adding_player"),
         {:ok, player} <- Fsmx.transition(player, "idle") do
      Fsmx.transition(%Game{game | players: [player | game.players]}, "created")
    end
  end

  def begin_setup(game) do
    with {:ok, game} <- Fsmx.transition(game, "setup_adventurers") do
      {:ok, game}
    end
  end
end
