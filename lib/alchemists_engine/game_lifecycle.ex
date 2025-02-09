defmodule AlchemistsEngine.GameLifecycle do
  alias AlchemistsEngine.Game

  use Fsmx.Fsm,
    transitions: %{
      "created" => ["adding_player", "setup_adventurers"],
      "adding_player" => ["created"],
      "setup_adventurers" => ["setup_artifacts"],
      "setup_artifacts" => ["setup_favours"],
      "setup_favours" => ["setup_ingredients"],
      "setup_ingredients" => ["deal_to_players"],
      "deal_to_players" => ["player_setup_choices"],
      "player_setup_choices" => ["player_setup_choices", "choose_turn_order"]
    }

  def before_transition(%Game{players: players}, "created", "adding_player", :state)
      when length(players) >= 4 do
    {:error, "game already at player limit"}
  end

  def before_transition(%Game{players: players}, "created", "setup_adventurers", :state)
      when length(players) < 2 do
    {:error, "game needs at least two players to start"}
  end

  def before_transition(game = %Game{}, "created", "setup_adventurers", :state) do
    {:ok, struct(game, adventurers: AlchemistsEngine.Adventurer.pick_for_setup())}
  end

  def before_transition(game = %Game{}, "setup_adventurers", "setup_artifacts", :state) do
    {:ok, struct(game, artifacts: AlchemistsEngine.Artifact.pick_for_setup())}
  end

  def before_transition(game = %Game{}, "setup_artifacts", "setup_favours", :state) do
    {:ok, struct(game, favours: AlchemistsEngine.Favour.setup())}
  end
end
