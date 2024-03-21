defmodule Rover.Grid do
  defstruct location: {0, 0}, direction: :north
  alias Rover.Robot
  @size 9
  def width, do: @size
  def height, do: @size

  def new do
    half_size = div(@size, 2)

    grid =
      for x <- -half_size..half_size,
          y <- -half_size..half_size,
          into: %{},
          do: {{x, y}, false}

    rover_start(grid, {0, 0}, :north)
  end

  # Places the rover at a specified position with a given orientation.
  def rover_start(grid, {x, y}, direction) when direction in [:north, :south, :east, :west] do
    Map.put(grid, {x, y}, %{rover: true, direction: direction})
  end

  def update_with_rover(grid, %Robot{location: {x, y}, direction: direction}) do
    Map.put(grid, {x, y}, %{rover: true, direction: direction})
  end
end
