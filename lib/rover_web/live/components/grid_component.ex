defmodule RoverWeb.GridComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    size = assigns.size

    sorted_grid =
      assigns.grid
      |> Map.to_list()
      |> Enum.sort_by(fn {{x, y}, _value} -> {-y, x} end)

    # IO.inspect(assigns.size, label: "DEBUGGING ASSIGNS") ASSIGNS = 11 HERE!

    assigns =
      assign(assigns, :sorted_grid, sorted_grid)
      |> assign(:size, size)
      # Ensure path_history is included in assigns
      |> assign(:path_history, assigns.path_history)

    ~H"""
    <div class="flex justify-center">
      <div style={"display: grid; grid-template-columns: repeat(" <> Integer.to_string(@size) <> ", minmax(0, 1fr)); gap: 1px;"}>
        <%= for {key, value} <- @sorted_grid do %>
          <div
            class="w-16 h-16 flex justify-center items-center border"
            style="grid-row: #{elem(key, 1) + 1}; grid-column: #{elem(key, 0) + 1};"
          >
            <.live_component
              :if={value.rover != false}
              id={"rover-#{elem(key, 0)}-#{elem(key, 1)}"}
              module={RoverWeb.RoverComponent}
              socket={@socket}
              direction={value.direction}
            />

            <.live_component
              :if={
                IO.inspect(@path_history, label: "GridComponent PATH HISTORY")

                Enum.any?(@path_history, fn path_coords ->
                  path_coords == {elem(key, 0), elem(key, 1)}
                end)
              }
              id={"arrow-#{elem(key, 0)}-#{elem(key, 1)}"}
              module={RoverWeb.ArrowComponent}
              socket={@socket}
              direction={value.direction}
              opacity="0.5"
            />

            <div class="bg-white-400 flex justify-center items-center">
              <span class="text-xs text-black">
                %{<%= elem(key, 0) %>, <%= elem(key, 1) %>}
              </span>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
