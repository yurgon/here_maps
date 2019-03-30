defmodule HereMaps.Request do
  @moduledoc false
  
  use HTTPoison.Base

  def get(endpoint, params) do
    query_params = Map.merge(credentials(), params) |> URI.encode_query
    get("#{endpoint}?#{query_params}", [], [])
  end

  defp credentials do
    %{
      app_id: app_id(),
      app_code: app_code()
    }
  end

  defp app_id do
    Application.get_env(:here_maps, :app_id) || System.get_env("HERE_MAPS_APP_ID")
  end

  defp app_code do
    Application.get_env(:here_maps, :app_code) || System.get_env("HERE_MAPS_APP_CODE")
  end
end
