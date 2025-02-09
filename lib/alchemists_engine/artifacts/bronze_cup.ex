defmodule AlchemistsEngine.Artifacts.BronzeCup do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Bronze Cup"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 4

  @impl ArtifactBehaviour
  def phase(), do: 3
end
