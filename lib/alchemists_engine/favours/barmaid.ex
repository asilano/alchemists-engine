defmodule AlchemistsEngine.Favours.Barmaid do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Barmaid"

  @impl FavourBehaviour
  def count(), do: 2
end
