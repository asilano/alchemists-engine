defmodule AlchemistsEngine.ArtifactBehaviour do
  @callback name() :: String.t()
  @callback phase() :: integer()
  @callback cost() :: integer()
  @callback points() :: integer() | :special
end

defmodule AlchemistsEngine.Artifact do
  alias AlchemistsEngine.Artifacts

  def pick_for_setup() do
    {
      for_phase(1) |> Enum.shuffle() |> Enum.take(3),
      for_phase(2) |> Enum.shuffle() |> Enum.take(3),
      for_phase(3) |> Enum.shuffle() |> Enum.take(3)
    }
  end

  defp for_phase(phase) do
    Enum.filter(all(), fn art -> art.phase == phase end)
  end

  defp all() do
    [
      Artifacts.RobeOfRespect,
      Artifacts.MagicMortar,
      Artifacts.PrintingPress,
      Artifacts.BootsOfSpeed,
      Artifacts.Periscope,
      Artifacts.DiscountCard,
      Artifacts.SealOfAuthority,
      Artifacts.ThinkingCap,
      Artifacts.AmuletOfRhetoric,
      Artifacts.WitchsTrunk,
      Artifacts.HypnoticAmulet,
      Artifacts.SilverChalice,
      Artifacts.WisdomIdol,
      Artifacts.FeatherInCap,
      Artifacts.CrystalCabinet,
      Artifacts.MagicMirror,
      Artifacts.AltarOfGold,
      Artifacts.BronzeCup
    ]
  end
end
