defmodule AlchemistsEngine.Favours.Custodian do
  alias AlchemistsEngine.FavourBehaviour
  @behaviour FavourBehaviour

  @impl FavourBehaviour
  def name(), do: "Custodian"

  @impl FavourBehaviour
  def count(), do: 3
end
