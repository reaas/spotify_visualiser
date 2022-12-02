defmodule SpotifyVisualiser.Schemas.Artist do
  use Ecto.Schema

  import Ecto.Changeset

  alias SpotifyVisualiser.Schemas.StreamingPlay
  alias SpotifyVisualiser.Schemas.Track

  alias __MODULE__

  schema "artist" do
    field :name, :string

    has_many(:tracks, Track)
    has_many(:streaming_plays, StreamingPlay)
  end

  def changeset(%Artist{} = artist, attrs) do
    artist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
