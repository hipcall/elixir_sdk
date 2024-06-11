defmodule HipcallSdk.MixProject do
  use Mix.Project

  @source_url "https://github.com/hipcall/elixir_sdk"
  @version "0.5.0"

  def project do
    [
      app: :hipcall_sdk,
      name: "HipcallSdk",
      description: "Official Hipcall API Wrapper written in Elixir.",
      version: @version,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HipcallSdk.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.18"},
      {:jason, "~> 1.4"},
      {:nimble_options, "~> 1.1"},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  def package do
    [
      maintainers: ["Onur Ozgur OZKAN"],
      licenses: ["MIT"],
      links: %{
        "Website" => "https://www.hipcall.com/en-gb/",
        "GitHub" => @source_url
      }
    ]
  end

  def docs do
    [
      main: "readme",
      name: "HipcallSdk",
      canonical: "https://hex.pm/packages/elixir_sdk",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: ["README.md", "CHANGELOG.md", "LICENSE.md"]
    ]
  end
end
