defmodule SpotifyVisualiser.Repo do
  use Ecto.Repo,
    otp_app: :spotify_visualiser,
    adapter: Ecto.Adapters.SQLite3
end
