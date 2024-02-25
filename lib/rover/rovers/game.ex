defmodule Rover.Rovers.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :location, :string
    field :direction, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:location, :direction])
    |> validate_required([:location, :direction])
  end
end
