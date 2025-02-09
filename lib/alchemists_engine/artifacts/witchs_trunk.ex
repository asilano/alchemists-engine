defmodule AlchemistsEngine.Artifacts.WitchsTrunk do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Witch's Trunk"

  @impl ArtifactBehaviour
  def cost(), do: 3

  @impl ArtifactBehaviour
  def points(), do: 2

  @impl ArtifactBehaviour
  def phase(), do: 2
end
