defmodule AlchemistsEngine.Game do
  alias AlchemistsEngine.Game

  defstruct [
    :state,
    :name,
    :inserted_at,
    players: [],
    alchemicals: %{},
    adventurers: [],
    artifacts: {},
    favours: [],
    favours_discard: [],
    ingredients: [],
    ingredients_discard: [],
    foraging: []
  ]

  use Fsmx.Struct, fsm: AlchemistsEngine.GameLifecycle

  def build(name) do
    {:ok,
     %Game{name: name, state: "created", inserted_at: DateTime.utc_now() |> DateTime.to_unix()}}
  end

  @spec add_player(%Game{}, %AlchemistsEngine.Player{}) :: {:ok, %Game{}} | {:error, any()}
  def add_player(game, player) do
    with {:ok, game} <- Fsmx.transition(game, "adding_player"),
         {:ok, player} <- Fsmx.transition(player, "idle") do
      Fsmx.transition(%Game{game | players: [player | game.players]}, "created")
    end
  end

  def begin_setup(game) do
    with {:ok, game} <- Fsmx.transition(game, "seed_rng"),
         {:ok, game} <- Fsmx.transition(game, "randomise_alchemicals"),
         {:ok, game} <- Fsmx.transition(game, "setup_adventurers"),
         {:ok, game} <- Fsmx.transition(game, "setup_artifacts"),
         {:ok, game} <- Fsmx.transition(game, "setup_favours"),
         {:ok, game} <- Fsmx.transition(game, "setup_ingredients") do
      {:ok, game}
    end
  end

  def randomise_alchemicals(game) do
    [
      AlchemistsEngine.Alchemical.ingredient_types(),
      Enum.shuffle(AlchemistsEngine.Alchemical.all())
    ]
    |> Enum.zip()
    |> Enum.into(%{})
    |> then(fn alchemicals -> struct(game, alchemicals: alchemicals) end)
  end

  def create_and_shuffle_ingredients(game) do
    AlchemistsEngine.Alchemical.ingredient_types()
    |> Enum.map(fn ingredient -> Utils.repeat([ingredient], 5) end)
    |> Enum.concat()
    |> Enum.shuffle()
    |> then(fn ingredients -> struct(game, ingredients: ingredients) end)
  end

  def draw_ingredients_for_foraging(
        game = %Game{ingredients: ingredients, ingredients_discard: discard}
      )
      when length(ingredients) < 5 and length(discard) > 0 do
    game |> shuffle_ingredient_discards() |> draw_ingredients_for_foraging()
  end

  def draw_ingredients_for_foraging(game) do
    {forage, deck} = Enum.split(game.ingredients, 5)
    struct(game, ingredients: deck, foraging: forage)
  end

  defp shuffle_ingredient_discards(game = %Game{ingredients: deck, ingredients_discard: discard}) do
    struct(game, ingredients: deck ++ Enum.shuffle(discard), ingredients_discard: [])
  end
end
