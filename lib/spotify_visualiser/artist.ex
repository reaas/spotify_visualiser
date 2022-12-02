defmodule SpotifyVisualiser.Artist do
  import Ecto.Query

  alias SpotifyVisualiser.Repo
  alias SpotifyVisualiser.Schemas.Artist
  alias SpotifyVisualiser.Schemas.Track
  alias SpotifyVisualiser.Schemas.StreamingPlay

  def insert_artist(attrs) do
    %Artist{}
    |> Artist.changeset(attrs)
    |> Repo.insert()
  end

  def update_artist(%Artist{} = artist, attrs) do
    artist
    |> Artist.changeset(attrs)
    |> Repo.update()
  end

  def get_artist(artist_id), do: Repo.get(Artist, artist_id)

  def get_artist!(artist_id), do: Repo.get!(Artist, artist_id)

  def get_artist_by_name(name) do
    from(
      artist in Artist,
      where: artist.name == ^name
    ) |> Repo.one()
  end

  def get_artist_by_name_and_track_name(artist_name, track_name) do
    from(
      artist in Artist,
      inner_join: track in Track,
      on: artist.id == track.artist_id,
      where: artist.name == ^artist_name,
      where: track.name == ^track_name
    ) |> Repo.one()
  end

  def get_artist_with_tracks(artist_id) do
    from(
      artist in Artist,
      preload: [:tracks],
      where: artist.id == ^artist_id
    ) |> Repo.all()
  end

  def get_tracks_by_artist(artist_id) do
    from(
      track in Track,
      where: track.artist_id == ^artist_id
    ) |> Repo.all()
  end

  def get_streaming_tracks_by_artist_id(artist_id) do
    from(
      streaming_play in StreamingPlay,
      where: streaming_play.artist_id == ^artist_id
    ) |> Repo.all()
  end
end
