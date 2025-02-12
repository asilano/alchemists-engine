defmodule AlchemistsEngine.GameLifecycle do
  alias AlchemistsEngine.Game

  use Fsmx.Fsm,
    transitions: %{
      "created" => ["adding_player", "seed_rng"],
      "adding_player" => ["created"],
      "seed_rng" => ["randomise_alchemicals"],
      "randomise_alchemicals" => ["setup_adventurers"],
      "setup_adventurers" => ["setup_artifacts"],
      "setup_artifacts" => ["setup_favours"],
      "setup_favours" => ["setup_ingredients"],
      "setup_ingredients" => ["deal_to_players"],
      "deal_to_players" => ["player_setup_choices"],
      "player_setup_choices" => ["player_setup_choices", "choose_turn_order"]
    }

  def before_transition(%Game{players: players}, _, "adding_player", :state)
      when length(players) >= 4 do
    {:error, "game already at player limit"}
  end

  def before_transition(%Game{players: players}, _, "seed_rng", :state)
      when length(players) < 2 do
    {:error, "game needs at least two players to start"}
  end

  def before_transition(game = %Game{inserted_at: inserted_at}, _, "seed_rng", :state) do
    :rand.seed(:exs1024, inserted_at)
    {:ok, game}
  end

  def before_transition(game, _, "randomise_alchemicals", :state) do
    {:ok, Game.randomise_alchemicals(game)}
  end

  def before_transition(game = %Game{}, _, "setup_adventurers", :state) do
    {:ok, struct(game, adventurers: AlchemistsEngine.Adventurer.pick_for_setup())}
  end

  def before_transition(game = %Game{}, _, "setup_artifacts", :state) do
    {:ok, struct(game, artifacts: AlchemistsEngine.Artifact.pick_for_setup())}
  end

  def before_transition(game = %Game{}, _, "setup_favours", :state) do
    {:ok, struct(game, favours: AlchemistsEngine.Favour.setup())}
  end

  def before_transition(game = %Game{}, _, "setup_ingredients", :state) do
    {:ok, game |> Game.create_and_shuffle_ingredients() |> Game.draw_ingredients_for_foraging()}
  end
end
