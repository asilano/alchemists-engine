defmodule AlchemistsEngine.Artifacts.SealOfAuthority do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Seal of Authority"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: 0

  @impl ArtifactBehaviour
  def phase(), do: 2
end
