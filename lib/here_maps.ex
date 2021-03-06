defmodule HereMaps do
  @moduledoc false
  
  alias HereMaps.{Geocode, ReverseGeocode, Places}

  def geocode(query, params \\ %{}, headers \\ []) do
    Geocode.call(query, params, headers)
  end

  def reverse_geocode(location, params \\ %{}, headers \\ []) do
    ReverseGeocode.call(location, params, headers)
  end

  def place_category_at(at, params \\ %{}, headers \\ []) do
    Places.category_at(at, params, headers)
  end

  def place_explore(params, headers) do 
    Places.explore(params, headers)
  end 
  
  def place_search(query, params, headers) do 
    Places.search(query, params, headers)
  end 
end
