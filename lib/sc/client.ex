defmodule SC.Client do
  
  @moduledoc """
    Client for the SoundCloud HTTP API
  """

  use HTTPoison.Base

  def process_url(url) do
    # TODO : use a lib for storing the key in ~/.sc
    "https://api.soundcloud.com" <> url <> "?client_id=" <> Application.get_env(:sc, :sc_api_key)
  end

  # JSON api
  def process_response_body(body), do: body |> Poison.decode!

  def get_track(track_id) do
    {:ok, response} = get "/tracks/#{track_id}" 
    format_track response.body
  end

  def format_track(json) do
    {
      :track,
      %{
        title: json["title"], 
        artist: json["user"]["username"], 
        id: json["id"], 
        permalink: (json["user"]["permalink"] <> "/" <> json["permalink"])
      }
    }
  end

end