defmodule SpotifyVisualiser.Schemas.Track do
  use Ecto.Schema

  import Ecto.Changeset

  alias SpotifyVisualiser.Schemas.Artist
  alias SpotifyVisualiser.Schemas.StreamingPlay
  alias __MODULE__

  schema "track" do
    field :name, :string
    belongs_to :artist, Artist

    has_many(:streaming_plays, StreamingPlay)
  end

  def changeset(%Track{} = track, attrs) do
    track
    |> cast(attrs, [:name, :artist_id])
    |> validate_required([:name, :artist_id])
  end
end
