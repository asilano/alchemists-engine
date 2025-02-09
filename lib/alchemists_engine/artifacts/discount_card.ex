defmodule AlchemistsEngine.Artifacts.DiscountCard do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Discount Card"

  @impl ArtifactBehaviour
  def cost(), do: 3

  @impl ArtifactBehaviour
  def points(), do: 1

  @impl ArtifactBehaviour
  def phase(), do: 1
end
