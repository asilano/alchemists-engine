defmodule AlchemistsEngine.Artifacts.PrintingPress do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Printing Press"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 2

  @impl ArtifactBehaviour
  def phase(), do: 1
end
