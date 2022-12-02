defmodule SpotifyVisualiser.StreamingPlay do
  import Ecto.Query

  alias SpotifyVisualiser.Repo
  alias SpotifyVisualiser.Schemas.StreamingPlay

  def insert_streaming_play(attrs) do
    %StreamingPlay{}
    |> StreamingPlay.changeset(attrs)
    |> Repo.insert()
  end

  def update_streaming_play(%StreamingPlay{} = streaming_play, attrs) do
    streaming_play
    |> StreamingPlay.changeset(attrs)
    |> Repo.update()
  end

  def get_streaming_play_ms_by_date() do
    from(
      streaming_play in StreamingPlay,
      select: %{
        date: fragment("cast(? as date)", streaming_play.end_time),
        total_ms_played: sum(streaming_play.ms_played)
      },
      group_by: [fragment("cast(? as date)", streaming_play.end_time)]
    ) |> Repo.all()
  end
end
