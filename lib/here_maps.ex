defmodule HereMaps do
  @moduledoc false
  
  alias HereMaps.{Geocode, ReverseGeocode}

  def geocode(query, params \\ %{}) do
    Geocode.call(query, params)
  end

  def reverse_geocode(location, params \\ %{}) do
    ReverseGeocode.call(location, params)
  end
end
