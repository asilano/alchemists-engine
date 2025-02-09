defmodule AlchemistsEngine.Artifacts.CrystalCabinet do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Crystal Cabinet"

  @impl ArtifactBehaviour
  def cost(), do: 5

  @impl ArtifactBehaviour
  def points(), do: :special

  @impl ArtifactBehaviour
  def phase(), do: 3
end
