defmodule HereMaps.Places do
  @moduledoc false
  
  alias HereMaps.{Request}

  @base_url "https://places.api.here.com/places/v1"

  def search_query(q, params \\ %{}) do
    case Request.get(@base_url, geocode_params(query, params)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = body |> Poison.Parser.parse!
        result = body |> Map.get("Response") |> Map.get("View") |> Enum.at(0) |> Map.get("Result")
        {:ok, result }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end



  defp places_params(query, params) do
    %{ q: query } |> Map.merge(params)
  end

end  