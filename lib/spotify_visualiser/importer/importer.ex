defmodule SpotifyVisualiser.Importer do
  alias SpotifyVisualiser.Artist

  def process_streaming_data([], result_list), do: result_list

  def process_streaming_data([head | tail], result_list) do
    artist =
      case Artist.get_artist_by_name_and_track_name(head.artistName, head.trackName) do
        nil -> Artist.get_artist_by_name(head.artistName)
        artist -> artist
      end

    artist =
      if is_nil(artist) do
        Artist.insert_artist(%{name: head.artistName})
      else
        artist
      end

    process_streaming_data(tail, [artist | result_list])
  end
end
