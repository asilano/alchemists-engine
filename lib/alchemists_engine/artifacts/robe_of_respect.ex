defmodule AlchemistsEngine.Artifacts.RobeOfRespect do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Robe of Respect"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 0

  @impl ArtifactBehaviour
  def phase(), do: 1
end
