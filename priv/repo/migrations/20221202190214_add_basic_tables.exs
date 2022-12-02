defmodule SpotifyVisualiser.Repo.Migrations.AddBasicTables do
  use Ecto.Migration

  def change do
    create table("artist") do
      add :name, :string

      timestamps()
    end

    create table("track") do
      add :name, :string
      add :artist_id, references(:artist)

      timestamps()
    end

    create table("streaming_play") do
      add :end_time, :naive_datetime
      add :ms_played, :integer
      add :artist_id, references(:artist)
      add :track_id, references(:track)

      timestamps()
    end
  end
end
