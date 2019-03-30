defmodule HereMaps.ReverseGeocode do
  @moduledoc false
  
  alias HereMaps.{Request}

  @base_url "https://reverse.geocoder.cit.api.here.com/6.2/reversegeocode.json"

  def call(location, params \\ %{}) do
    case Request.get(@base_url, reverse_geocode_params(location, params)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = body |> Poison.Parser.parse!
        result = body |> Map.get("Response") |> Map.get("View") |> Enum.at(0) |> Map.get("Result")
        {:ok, result }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp reverse_geocode_params(location, params) do
    %{
      prox: location,
      mode: "retrieveAddresses",
      maxresults: 1,
      gen: 8
    } |> Map.merge(params)
  end
end
