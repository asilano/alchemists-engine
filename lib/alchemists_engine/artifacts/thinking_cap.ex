defmodule AlchemistsEngine.Artifacts.ThinkingCap do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Thinking Cap"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 1

  @impl ArtifactBehaviour
  def phase(), do: 2
end
