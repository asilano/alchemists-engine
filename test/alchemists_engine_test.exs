defmodule AlchemistsEngineTest do
  use ExUnit.Case
  doctest AlchemistsEngine

  test "creates a game" do
    assert {:ok, %AlchemistsEngine.Game{name: "Test Game"}} =
             AlchemistsEngine.create_game("Test Game")
  end

  test "creates a player" do
    assert {:ok, %AlchemistsEngine.Player{name: "Alan"}} = AlchemistsEngine.create_player("Alan")
  end

  test "adds a player to a game in creation state" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    {:ok, player} = AlchemistsEngine.create_player("Alan")
    assigned_player = %AlchemistsEngine.Player{player | state: "idle"}

    assert {:ok, %AlchemistsEngine.Game{players: [^assigned_player]}} =
             AlchemistsEngine.add_player_to_game(game, player)
  end

  test "cannot add a player to a full game" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    {:ok, player} = AlchemistsEngine.create_player("Alan")
    player = struct(player, state: "idle")
    game = struct(game, players: [player, player, player, player])

    assert {:error, "game already at player limit"} =
             AlchemistsEngine.add_player_to_game(game, player)
  end

  test "cannot add a player to a game in non-creating state" do
    game =
      AlchemistsEngine.create_game("Test Game") |> elem(1) |> struct(state: "setup_artifacts")

    {:ok, player} = AlchemistsEngine.create_player("Alan")

    assert {:error, "invalid transition" <> _} = AlchemistsEngine.add_player_to_game(game, player)
  end

  test "cannot add a non-floating player to a game" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    player = AlchemistsEngine.create_player("Alan") |> elem(1) |> struct(state: "idle")

    assert {:error, "invalid transition" <> _} = AlchemistsEngine.add_player_to_game(game, player)
  end

  test "cannot begin setting up a game with fewer than 2 players" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    {:ok, player} = AlchemistsEngine.create_player("Alan")
    {:ok, game} = AlchemistsEngine.add_player_to_game(game, player)

    assert {:error, "game needs at least two" <> _} = AlchemistsEngine.begin_setup(game)
  end

  test "setting up a game adds 5 Adventurers to the game" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    {:ok, player} = AlchemistsEngine.create_player("Alan")
    player = struct(player, state: "idle")
    game = struct(game, players: [player, player, player, player])

    assert {:ok,
            %AlchemistsEngine.Game{
              adventurers: [
                %AlchemistsEngine.Adventurer{},
                %AlchemistsEngine.Adventurer{},
                %AlchemistsEngine.Adventurer{},
                %AlchemistsEngine.Adventurer{},
                %AlchemistsEngine.Adventurer{}
              ]
            }} = AlchemistsEngine.begin_setup(game)
  end

  test "setting up a game adds three sets of three Artifacts to the game" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    {:ok, player} = AlchemistsEngine.create_player("Alan")
    player = struct(player, state: "idle")
    game = struct(game, players: [player, player, player, player])

    assert {:ok, %AlchemistsEngine.Game{artifacts: {phase_1, phase_2, phase_3}}} =
             AlchemistsEngine.begin_setup(game)

    assert length(phase_1) == 3
    assert length(phase_2) == 3
    assert length(phase_3) == 3
    assert length(Enum.uniq(phase_1)) == 3
    assert length(Enum.uniq(phase_2)) == 3
    assert length(Enum.uniq(phase_3)) == 3

    assert Enum.all?(phase_1, fn art -> art.phase() == 1 end)
    assert Enum.all?(phase_2, fn art -> art.phase() == 2 end)
    assert Enum.all?(phase_3, fn art -> art.phase() == 3 end)
  end

  test "setting up a game adds a list of 22 favours to the game" do
    {:ok, game} = AlchemistsEngine.create_game("Test Game")
    {:ok, player} = AlchemistsEngine.create_player("Alan")
    player = struct(player, state: "idle")
    game = struct(game, players: [player, player, player, player])

    assert {:ok, %AlchemistsEngine.Game{favours: favours}} = AlchemistsEngine.begin_setup(game)

    assert length(favours) == 22
  end
end
