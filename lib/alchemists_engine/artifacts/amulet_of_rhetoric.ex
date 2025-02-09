defmodule AlchemistsEngine.Artifacts.AmuletOfRhetoric do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Amulet of Rhetoric"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 0

  @impl ArtifactBehaviour
  def phase(), do: 2
end
