defmodule AlchemistsEngine.Artifacts.MagicMirror do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Magic Mirror"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: :special

  @impl ArtifactBehaviour
  def phase(), do: 3
end
