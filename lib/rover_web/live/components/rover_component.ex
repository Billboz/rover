defmodule RoverWeb.RoverComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    direction_svg_path = direction_icon(assigns.direction)
    assigns = assign(assigns, :direction_svg_path, direction_svg_path)

    ~H"""
    <img src={@direction_svg_path} alt="Rover" width="50" height="50" />
    """
  end

  defp direction_icon(:north), do: "/images/roverNorth.svg"
  defp direction_icon(:south), do: "/images/roverSouth.svg"
  defp direction_icon(:east), do: "/images/roverEast.svg"
  defp direction_icon(:west), do: "/images/roverWest.svg"
end
