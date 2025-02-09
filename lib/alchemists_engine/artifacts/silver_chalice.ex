defmodule AlchemistsEngine.Artifacts.SilverChalice do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Silver Chalice"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 6

  @impl ArtifactBehaviour
  def phase(), do: 2
end
