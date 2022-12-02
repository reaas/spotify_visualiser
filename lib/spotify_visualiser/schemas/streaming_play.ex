defmodule SpotifyVisualiser.Schemas.StreamingPlay do
  use Ecto.Schema

  import Ecto.Changeset

  alias SpotifyVisualiser.Schemas.Artist
  alias SpotifyVisualiser.Schemas.Track
  alias __MODULE__

  schema "streaming_play" do
    field :end_time, :naive_datetime
    field :ms_played, :integer
    belongs_to :artist, Artist
    belongs_to :track, Track
  end

  def changeset(%StreamingPlay{} = streaming_play, attrs) do
    streaming_play
    |> cast(attrs, [
      :end_time,
      :ms_played,
      :artist_id,
      :track_id
    ])
    |> validate_required([
      :end_time,
      :ms_played,
      :artist_id,
      :track_id
    ])
  end
end
