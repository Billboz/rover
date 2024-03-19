defmodule RoverWeb.GameLive do
  use Phoenix.LiveView
  alias Rover.Robot

  def mount(_params, _session, socket) do
    socket = assign(socket, robot: Robot.new())
    {:ok, update_direction_svg(socket)}
  end

  def handle_event("left", _params, socket) do
    robot = Robot.left(socket.assigns.robot)
    {:noreply, update_direction_svg(assign(socket, robot: robot))}
  end

  def handle_event("forward", _params, socket) do
    robot = Robot.forward(socket.assigns.robot)
    {:noreply, update_direction_svg(assign(socket, robot: robot))}
  end

  def handle_event("right", _params, socket) do
    robot = Robot.right(socket.assigns.robot)
    {:noreply, update_direction_svg(assign(socket, robot: robot))}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= @direction_svg %>
      <button phx-click="left">Left</button>
      <button phx-click="forward">Forward</button>
      <button phx-click="right">Right</button>
    </div>
    """
  end

  defp update_direction_svg(socket) do
    # I think a case statement here that checks the direction of the robot and returns the correct image
    direction_svg_path =
      case socket.assigns.robot.direction do
        :north -> "/images/roverNorth.svg"
        :east -> "/images/roverEast.svg"
        :south -> "/images/roverSouth.svg"
        :west -> "/images/roverWest.svg"
      end

    direction_svg =
      Phoenix.HTML.raw(
        "<img src=\"#{direction_svg_path}\" alt=\"Rover Image\" width=\"50\" height=\"50\" />"
      )

    assign(socket, :direction_svg, direction_svg)
  end
end
