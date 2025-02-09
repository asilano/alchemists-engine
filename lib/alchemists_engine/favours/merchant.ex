defmodule AlchemistsEngine.Favours.Merchant do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Merchant"

  @impl FavourBehaviour
  def count(), do: 2
end
