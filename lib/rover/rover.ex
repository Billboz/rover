defmodule Rover.Rover do
  # Bruces directions to solve the Rover problem.
  # Start with the right data - location and orientation
  #   defstruct direction: :north, location: {0, 0}
  # CRC
  # the Constructor needs to be created with the new/0 function
  #

  # 1st - Define the structure of the rover with its initial direction and location.
  defstruct location: {0, 0}, direction: :north
  alias Rover.Grid
  # 5th - Define the function to move the rover based on the given command.
  # Pattern matching is used to determine which function to call.
  def move(rover, "L"), do: left(rover)
  def move(rover, "R"), do: right(rover)
  def move(rover, "F"), do: forward(rover)

  # 2nd - Define a function to create a new rover with the default direction and location.
  def new() do
    %__MODULE__{}
  end

  # 3rd - Define a function to turn the rover left.
  def left(rover) do
    case rover.direction do
      :north -> %{rover | direction: :west}
      :east -> %{rover | direction: :north}
      :south -> %{rover | direction: :east}
      :west -> %{rover | direction: :south}
    end
  end

  # 4th - Define a function to turn the rover right.
  def right(rover) do
    case rover.direction do
      :north -> %{rover | direction: :east}
      :east -> %{rover | direction: :south}
      :south -> %{rover | direction: :west}
      :west -> %{rover | direction: :north}
    end
  end

  # 5th - Define a function to move the rover forward.
  defp forward(%Rover.Rover{location: {x, y}, direction: direction} = rover) do
    case direction do
      :north -> %{rover | location: {x, y + 1}}
      :east -> %{rover | location: {x + 1, y}}
      :south -> %{rover | location: {x, y - 1}}
      :west -> %{rover | location: {x - 1, y}}
    end
  end

  # LAST - SDefine a function to move the rover based on a list of commands.
  def move_all(rover, grid) do
    moves = ~w(F L R)

    1..10
    |> Enum.map(fn _ -> Enum.random(moves) end)
    |> Enum.join()
    |> String.graphemes()
    |> Enum.reduce({rover, grid}, fn move, {acc_rover, acc_grid} ->
      :timer.sleep(500)
      updated_rover = move(acc_rover, move)
      updated_grid = Grid.update_with_rover(acc_grid, updated_rover)
      IO.inspect(updated_rover, label: "after move #{move}")
      {updated_rover, updated_grid}
    end)
  end

  # Now can be run in the terminal with "Rover.new |> Rover.move_all" or "rover = Rover.new" then "Rover.move_all(rover)"
  # Could make a call from 'move_all' to include the 'Rover.new'??? So only 'Rover.move_all' is needed.
end
