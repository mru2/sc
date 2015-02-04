defmodule SC.Mixfile do
  use Mix.Project

  def project do
    [app: :sc,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps,
     escript: escript]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      env: [sc_api_key: "cd79697779afba967d0fb3965a71dbc9"],
      applications: [:logger, :httpoison],
      mod: {SC, []}
    ]
  end

  # CLI Entry points
  def escript do
    [main_module: SC.CLI]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.6"},
      {:poison, "~> 1.3.1"}
    ]
  end
end
