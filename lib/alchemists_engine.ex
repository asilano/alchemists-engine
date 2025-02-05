defmodule AlchemistsEngine do
  @moduledoc """
  Documentation for `AlchemistsEngine`.
  """
  alias AlchemistsEngine.Game

  @doc """
  Create a new game with the specified name
  """
  def create_game(name) do
    Game.create(name)
  end
end
