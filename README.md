# HereMaps

Elixir wrapper around Here Maps APIs

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `here_maps` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:here_maps, "~> 0.1.0", github: "yurgon/here_maps"}
  ]
end

def application do
  [applications: [:here_maps]]
end

# In your application's `config/config.exs`, add:

config :here_maps,
  app_id: "YOUR APP ID HERE",
  app_code: "YOUR APP CODE HERE"
  
```

## Example

```elixir
HereMaps.geocode("77 robinson singapore")
HereMaps.reverse_geocode("41.8839,-87.6389,250")
```

## License

The package is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
