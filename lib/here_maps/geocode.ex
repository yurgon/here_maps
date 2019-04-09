defmodule HereMaps.Geocode do
  @moduledoc false
  
  alias HereMaps.{Request}

  @base_url "https://geocoder.cit.api.here.com/6.2/geocode.json"

  def call(query, params \\ %{}, headers \\ []) do
    case Request.send(@base_url, geocode_params(query, params), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = body |> Poison.Parser.parse!
        result = body |> Map.get("Response") |> Map.get("View") |> Enum.at(0) |> Map.get("Result")
        {:ok, result }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp geocode_params(query, params) do
    %{ searchtext: query } |> Map.merge(params)
  end
end
