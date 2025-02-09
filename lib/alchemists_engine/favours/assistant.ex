defmodule AlchemistsEngine.Favours.Assistant do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Assistant"

  @impl FavourBehaviour
  def count(), do: 4
end
