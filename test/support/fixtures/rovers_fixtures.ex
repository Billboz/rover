defmodule Rover.RoversFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rover.Rovers` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        direction: "some direction",
        location: "some location"
      })
      |> Rover.Rovers.create_game()

    game
  end
end
