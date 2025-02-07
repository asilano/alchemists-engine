
  def before_transition(game = %Game{}, "created", "setup_adventurers", :state) do
    {:ok, struct(game, adventurers: AlchemistsEngine.Adventurer.pick_for_setup())}
  end
