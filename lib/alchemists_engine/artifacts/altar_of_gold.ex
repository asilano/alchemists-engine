defmodule AlchemistsEngine.Artifacts.AltarOfGold do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Altar of Gold"

  @impl ArtifactBehaviour
  def cost(), do: 1

  @impl ArtifactBehaviour
  def points(), do: 0

  @impl ArtifactBehaviour
  def phase(), do: 3
end
