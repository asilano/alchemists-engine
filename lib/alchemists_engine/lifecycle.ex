defmodule AlchemistsEngine.Lifecycle do
  use Fsmx.Fsm,
    transitions: %{
      "created" => ["created", "setup_adventurers"],
      "setup_adventurers" => ["setup_artifacts"],
      "setup_artifacts" => ["setup_ingredients"],
      "setup_ingredients" => ["deal_to_players"],
      "deal_to_players" => ["player_setup_choices"],
      "player_setup_choices" => ["player_setup_choices", "choose_turn_order"]
    }
end
