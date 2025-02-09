defmodule AlchemistsEngine.Favours.Associate do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Associate"

  @impl FavourBehaviour
  def count(), do: 3
end
