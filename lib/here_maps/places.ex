defmodule HereMaps.Places do
  @moduledoc false
  
  alias HereMaps.{Request}

  @base_url "https://places.api.here.com/places/v1"

  def search(query, params, headers) do
    case Request.send(@base_url <> "/discover/search", places_params(query, params), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = body |> Poison.Parser.parse!
        result = body |> Map.get("results") |> Map.get("items") 
        {:ok, result }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end


  def explore(params, headers) do
    case Request.send(@base_url <> "/discover/explore", params, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = body |> Poison.Parser.parse!
        result = body |> Map.get("results") |> Map.get("items") 
        {:ok, result }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def category_at(at, params, headers) do
    params = %{ at: at } |> Map.merge(params)
    case Request.send(@base_url <> "/categories/places", params, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body = body |> Poison.Parser.parse!
        result = body |> Map.get("items")
        {:ok, result }
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end


  defp places_params(query, params) do
    %{ q: query } |> Map.merge(params)
  end

end  