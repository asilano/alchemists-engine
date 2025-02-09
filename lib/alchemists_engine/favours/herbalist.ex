defmodule AlchemistsEngine.Favours.Herbalist do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Herbalist"

  @impl FavourBehaviour
  def count(), do: 4
end
