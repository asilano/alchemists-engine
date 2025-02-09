defmodule AlchemistsEngine.Artifacts.HypnoticAmulet do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Hypnotic Amulet"

  @impl ArtifactBehaviour
  def cost(), do: 3

  @impl ArtifactBehaviour
  def points(), do: 1

  @impl ArtifactBehaviour
  def phase(), do: 2
end
