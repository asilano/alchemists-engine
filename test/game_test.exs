defmodule GameTest do
  alias AlchemistsEngine.Game
  use ExUnit.Case
  doctest AlchemistsEngine.Game

  test "draws 5 cards for foraging" do
    game =
      struct(Game.build("Test") |> elem(1),
        ingredients: [1, 2, 3, 4, 5, 6, 7, 8],
        foraging: [],
        ingredients_discard: []
      )

    %Game{ingredients: deck, foraging: foraging, ingredients_discard: discard} =
      Game.draw_ingredients_for_foraging(game)

    assert deck == [6, 7, 8]
    assert foraging == [1, 2, 3, 4, 5]
    assert discard == []
  end

  test "shuffles discards if the deck is under-full" do
    game =
      struct(Game.build("Test") |> elem(1),
        ingredients: [1, 2, 3],
        foraging: [],
        ingredients_discard: [4, 5, 6, 7, 8]
      )

    %Game{ingredients: deck, foraging: foraging, ingredients_discard: discard} =
      Game.draw_ingredients_for_foraging(game)

    assert length(deck) == 3
    assert [1, 2, 3, _, _] = foraging
    assert discard == []
  end

  test "draws as best it can if there aren't enough in total" do
    game =
      struct(Game.build("Test") |> elem(1),
        ingredients: [1, 2],
        foraging: [],
        ingredients_discard: [4, 5]
      )

    %Game{ingredients: deck, foraging: foraging, ingredients_discard: discard} =
      Game.draw_ingredients_for_foraging(game)

    assert length(deck) == 0
    assert [1, 2, _, _] = foraging
    assert discard == []
  end
end
