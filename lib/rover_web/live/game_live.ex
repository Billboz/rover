defmodule RoverWeb.GameLive do
  use Phoenix.LiveView
  alias Rover.Robot

  def mount(_params, _session, socket) do
    {:ok, assign(socket, robot: Robot.new())}
  end

  def handle_event("left", _params, socket) do
    robot = Robot.left(socket.assigns.robot)
    {:noreply, assign(socket, robot: robot)}
  end

  def handle_event("forward", _params, socket) do
    robot = Robot.forward(socket.assigns.robot)
    {:noreply, assign(socket, robot: robot)}
  end

  def handle_event("right", _params, socket) do
    robot = Robot.right(socket.assigns.robot)
    {:noreply, assign(socket, robot: robot)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.rover robot={@robot} />
      <button phx-click="left">Left</button>
      <button phx-click="forward">Forward</button>
      <button phx-click="right">Right</button>
    </div>
    """
  end

  attr(:robot, :any, required: true)

  # add svg here?
  def rover(assigns) do
    ~H"""
    <div>
      <pre>
        <%= inspect(assigns, pretty: true) %>
      </pre>
    </div>
    """
  end

  defp initial_grid_state do
    # Define initial grid state
  end
end
