defmodule AlchemistsEngine.Favours.Shopkeeper do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Shopkeeper"

  @impl FavourBehaviour
  def count(), do: 2
end
