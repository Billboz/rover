defmodule RoverWeb.GameLive do
  use Phoenix.LiveView
  alias Rover.{Robot, Grid}

  def mount(_params, _session, socket) do
    grid = Rover.Grid.new()
    size = Rover.Grid.width()
    robot = Rover.Robot.new()
    path_history = []
    {:ok, assign(socket, grid: grid, size: size, robot: robot, path_history: path_history)}
  end

  def handle_event("left", _params, socket) do
    robot = Robot.left(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    path_history = Robot.update_path_history(robot)
    {:noreply, assign(socket, grid: grid, robot: robot, path_history: path_history)}
  end

  def handle_event("forward", _params, socket) do
    robot = Robot.move(socket.assigns.robot, "F")
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    path_history = Robot.update_path_history(robot)
    {:noreply, assign(socket, grid: grid, robot: robot, path_history: path_history)}
  end

  def handle_event("right", _params, socket) do
    robot = Robot.right(socket.assigns.robot)
    grid = Grid.update_with_rover(socket.assigns.grid, robot)
    path_history = Robot.update_path_history(robot)
    {:noreply, assign(socket, grid: grid, robot: robot, path_history: path_history)}
  end
end
