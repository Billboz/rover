defmodule Rover.Robot do
  require Logger
  defstruct location: {0, 0}, direction: :north

  def move(rover, "L"), do: left(rover)
  def move(rover, "R"), do: right(rover)
  def move(rover, "F"), do: forward(rover)

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

    Logger.info("Rover moved forward to: #{inspect(new_rover.location)}")
    new_rover
  end
end
