defmodule AlchemistsEngine.Artifacts.WisdomIdol do
  alias AlchemistsEngine.ArtifactBehaviour
  @behaviour ArtifactBehaviour

  @impl ArtifactBehaviour
  def name(), do: "Wisdom Idol"

  @impl ArtifactBehaviour
  def cost(), do: 4

  @impl ArtifactBehaviour
  def points(), do: :special

  @impl ArtifactBehaviour
  def phase(), do: 3
end
