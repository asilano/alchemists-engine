defmodule AlchemistsEngine.Artifacts.FeatherInCap do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Feather in Cap"

  @impl ArtifactBehaviour
  def cost(), do: 3

  @impl ArtifactBehaviour
  def points(), do: :special

  @impl ArtifactBehaviour
  def phase(), do: 3
end
