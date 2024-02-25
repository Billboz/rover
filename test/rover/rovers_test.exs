defmodule Rover.RoversTest do
  use Rover.DataCase

  alias Rover.Rovers

  describe "games" do
    alias Rover.Rovers.Game

    import Rover.RoversFixtures

    @invalid_attrs %{location: nil, direction: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Rovers.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Rovers.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{location: "some location", direction: "some direction"}

      assert {:ok, %Game{} = game} = Rovers.create_game(valid_attrs)
      assert game.location == "some location"
      assert game.direction == "some direction"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rovers.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{location: "some updated location", direction: "some updated direction"}

      assert {:ok, %Game{} = game} = Rovers.update_game(game, update_attrs)
      assert game.location == "some updated location"
      assert game.direction == "some updated direction"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Rovers.update_game(game, @invalid_attrs)
      assert game == Rovers.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Rovers.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Rovers.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Rovers.change_game(game)
    end
  end
end
