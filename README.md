# HereMaps

Elixir wrapper around Here Maps APIs

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_heremaps` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_heremaps, "~> 0.1.0"}
  ]
end

def application do
  [applications: [:google_maps]]
end

# In your application's `config/config.exs`, add:

config :here_maps,
  app_id: "YOUR APP ID HERE"

config :here_maps,
  app_code: "YOUR APP CODE HERE"
```

## Example

```elixir
HereMaps.geocode("77 robinson singapore")
HereMaps.reverse_geocode("41.8839,-87.6389,250")
```

## Todo
- [] Documentation
- [] GEOCODER AUTOCOMPLETE
- [] BATCH GEOCODER
- [] GEOFENCING
- [] ROUTING
- [] PLACES
- [] TRAFFIC
- [] More test
- [] Or more available on request

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kimquy/ex_heremaps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The package is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_heremaps](https://hexdocs.pm/ex_heremaps).
