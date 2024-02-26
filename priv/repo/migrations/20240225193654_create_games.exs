defmodule Rover.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :location, :string
      add :direction, :string

      timestamps()
    end
  end
end
