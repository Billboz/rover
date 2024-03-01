defmodule Rover.Grid do
  defstruct location: {0, 0}, direction: :north
  alias Rover.Rover
  @size 3
  def width, do: @size
  def height, do: @size

  def new do
    grid = for x <- -@size..width(), y <- -@size..height(), into: %{}, do: {{x, y}, false}
    rover_start(grid, {0, 0}, :north)
  end

  # Places the rover at a specified position with a given orientation.
  def rover_start(grid, {x, y}, direction) when direction in [:north, :south, :east, :west] do
    Map.put(grid, {x, y}, %{rover: true, direction: direction})
  end

  def update_with_rover(grid, %Rover{location: {x, y}, direction: direction}) do
    Map.put(grid, {x, y}, %{rover: true, direction: direction})
  end

  # LAST CHANCE PLEASE
  
end
