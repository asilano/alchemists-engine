defmodule AlchemistsEngine.Artifacts.BootsOfSpeed do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Boots of Speed"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 2

  @impl ArtifactBehaviour
  def phase(), do: 1
end
