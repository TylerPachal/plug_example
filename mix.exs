defmodule PlugExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_example,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PlugExample.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.9"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
