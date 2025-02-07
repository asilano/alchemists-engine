defmodule AlchemistsEngine do
  @moduledoc """
  Documentation for `AlchemistsEngine`.
  """
  alias AlchemistsEngine.Player
  alias AlchemistsEngine.Game

  @doc """
  Create a new game with the specified name
  """
  def create_game(name) do
    Game.build(name)
  end

  def create_player(name) do
    Player.build(name)
  end

  def add_player_to_game(game, player) do
    Game.add_player(game, player)
  end

  def begin_setup(game) do
    Game.begin_setup(game)
  end
end
