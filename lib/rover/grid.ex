defmodule Rover.Grid do
  require Logger

  @size 11

  def width(), do: @size

  def new() do
    half_size = div(@size, 2)

    grid =
      for x <- -half_size..half_size,
          y <- -half_size..half_size,
          into: %{},
          do: {{x, y}, %{rover: false}}

    # IO.inspect(grid, label: "Initial grid")
    # Adjusted to remove specific initial position and direction
    Rover.Robot.rover_start(grid)
  end

  def update_with_rover(grid, %{location: {x, y}, direction: direction} = rover) do
    updated_grid =
      Map.update!(grid, {x, y}, fn cell -> Map.put(cell, :rover, %{direction: direction}) end)

    Logger.info("Grid.Update With Rover to: #{inspect(rover)}")
    updated_grid
  end

  def update_grid_with_path_history(grid, path_history) do
    updated_history =
      Enum.reduce(path_history, grid, fn {x, y}, acc ->
        Map.put(acc, {x, y}, %{rover: false, direction: :path})
      end)

    Logger.info("Grid.Update Grid With Path History: #{inspect(updated_history, pretty: true)}")
    # Logger.info("Path HISTORY contents? #{inspect(path_history)}")
    updated_history
  end
end
