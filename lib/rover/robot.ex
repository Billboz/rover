defmodule Rover.Robot do
  require Logger
  defstruct location: {0, 0}, direction: :north, path_history: []

  def move(rover, direction) do
    # Pre-update path history for forward movement
    rover = if direction == "F", do: update_path_history(rover), else: rover

    case direction do
      "F" -> forward(rover)
      "L" -> left(rover)
      "R" -> right(rover)
    end
  end

  def new() do
    %__MODULE__{}
  end

  def rover_start(grid) do
    Map.put(grid, {0, 0}, %{rover: true, direction: :north})
  end

  def left(rover) do
    case rover.direction do
      :north -> %{rover | direction: :west}
      :east -> %{rover | direction: :north}
      :south -> %{rover | direction: :east}
      :west -> %{rover | direction: :south}
    end
  end

  def right(rover) do
    case rover.direction do
      :north -> %{rover | direction: :east}
      :east -> %{rover | direction: :south}
      :south -> %{rover | direction: :west}
      :west -> %{rover | direction: :north}
    end
  end

  def forward(%__MODULE__{location: {x, y}, direction: direction} = rover) do
    new_rover =
      case direction do
        :north -> %{rover | location: {x, y + 1}}
        :east -> %{rover | location: {x + 1, y}}
        :south -> %{rover | location: {x, y - 1}}
        :west -> %{rover | location: {x - 1, y}}
      end

    Logger.info("Robot.Forward to: #{inspect(new_rover.location)}")
    new_rover
  end

  def update_path_history(%__MODULE__{location: location, path_history: path_history} = rover) do
    # This function now correctly updates before moving, so no changes needed here
    new_path_history = [location | path_history]
    Logger.info("Robot.Update Path History: #{inspect(new_path_history)}")
    %{rover | path_history: new_path_history}
  end
end
