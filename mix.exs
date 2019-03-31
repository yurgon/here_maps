defmodule HereMaps.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim

  def project do
    [
      app: :ex_heremaps,
      description: "Here Maps API wrapper in Elixir",
      version: @version,
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.5.0"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md VERSION),
      maintainers: ["Yury Chernov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/yurgon/here_maps.git"}
    ]
  end
end
