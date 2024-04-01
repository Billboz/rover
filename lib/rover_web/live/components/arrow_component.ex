defmodule RoverWeb.ArrowComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    arrow_svg_path = arrow_direction_icon(assigns.direction)
    assigns = assign(assigns, :arrow_svg_path, arrow_svg_path)
    # assigns = assign(assigns, :opacity, assigns.opacity || "1.0")

    ~H"""
    <img src={@arrow_svg_path} alt="Arrow" style="opacity: {@opacity}" width="50" height="50" />
    """
  end

  defp arrow_direction_icon(:north), do: "/images/arrow-up.svg"
  defp arrow_direction_icon(:south), do: "/images/arrow-down.svg"
  defp arrow_direction_icon(:east), do: "/images/arrow-right.svg"
  defp arrow_direction_icon(:west), do: "/images/arrow-left.svg"
end
