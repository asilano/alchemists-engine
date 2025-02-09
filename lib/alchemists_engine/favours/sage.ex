defmodule AlchemistsEngine.Favours.Sage do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Sage"

  @impl FavourBehaviour
  def count(), do: 2
end
