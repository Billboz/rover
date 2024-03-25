defmodule Rover.Robot do
  require Logger
  defstruct location: {0, 0}, direction: :north
  alias Rover.Grid

  def move(rover, "L"), do: left(rover)
  def move(rover, "R"), do: right(rover)
  def move(rover, "F"), do: forward(rover)

  def new() do
    %__MODULE__{}
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
end
