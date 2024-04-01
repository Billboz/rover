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
          do: {{x, y}, false}

    # IO.inspect(grid, label: "Initial grid")
    # Adjusted to remove specific initial position and direction
    Rover.Robot.rover_start(grid)
  end

  def update_with_rover(grid, %{location: {x, y}, direction: direction}) do
    updated_grid = Map.put(grid, {x, y}, %{rover: true, direction: direction})
    Logger.info("Updated grid: #{inspect(updated_grid)}")
    updated_grid
  end
end
