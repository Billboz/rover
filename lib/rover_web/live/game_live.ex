defmodule RoverWeb.GameLive do
  use Phoenix.LiveView
  alias Rover.{Robot, Grid}

  def mount(_params, _session, socket) do
    grid = Rover.Grid.new()
    # Assuming width and height are the same
    size = Rover.Grid.width()
    robot = Rover.Robot.new()
    {:ok, assign(socket, grid: grid, size: size, robot: robot)}
  end

  def handle_event("left", _params, socket) do
    robot = Robot.left(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def handle_event("forward", _params, socket) do
    robot = Robot.forward(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def handle_event("right", _params, socket) do
    robot = Robot.right(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end
end
