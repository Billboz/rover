defmodule RoverWeb.GameLive do
  use Phoenix.LiveView
  alias Rover.Robot

  def mount(_params, _session, socket) do
    grid = Rover.Grid.new()
    # Assuming width and height are the same
    size = Rover.Grid.width()
    robot = Rover.Robot.new()
    socket = assign(socket, grid: grid, size: size, robot: robot)
    {:ok, socket}
  end

  def handle_event("left", _params, socket) do
    robot = Robot.left(socket.assigns.robot)
    grid = socket.assigns.grid
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def handle_event("forward", _params, socket) do
    robot = Robot.forward(socket.assigns.robot)
    grid = socket.assigns.grid
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def handle_event("right", _params, socket) do
    robot = Robot.right(socket.assigns.robot)
    grid = socket.assigns.grid
    {:noreply, assign(socket, grid: grid, robot: robot)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= live_component(RoverWeb.GridComponent, id: "grid", grid: @grid, size: @size) %>
      <button phx-click="left">Left</button>
      <button phx-click="forward">Forward</button>
      <button phx-click="right">Right</button>
    </div>
    """
  end

  # defp update_direction_svg(socket) do
  #   direction_svg_path =
  #     case socket.assigns.robot.direction do
  #       :north -> "/images/roverNorth.svg"
  #       :east -> "/images/roverEast.svg"
  #       :south -> "/images/roverSouth.svg"
  #       :west -> "/images/roverWest.svg"
  #     end

  #   direction_svg =
  #     Phoenix.HTML.raw(
  #       "<img src=\"#{direction_svg_path}\" alt=\"Rover Image\" width=\"50\" height=\"50\" />"
  #     )

  #   assign(socket, :direction_svg, direction_svg)
  # end
end
