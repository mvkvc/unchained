defmodule Unchained.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "Language model agent framework."
  @source_url "https://git.mvk.vc/monorepo/libs/ex/unchained"

  def project do
    [
      app: :unchained,
      description: @description,
      source_url: @source_url,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      dialyzer: dialyzer(),
      deps: deps(),
      aliases: aliases()
    ]
  end

  def application do
    [
      mod: {Unchained.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"Git" => @source_url}
    ]
  end

  defp docs do
    [
      extras:
        [
          {:"README.md", [title: "Overview"]},
          File.ls!("./docs") |> Enum.filter(&String.ends_with?(&1, ".md")),
          {:"License.md", [title: "License"]}
        ]
        |> List.flatten(),
      main: "readme",
      assets: "assets",
      # logo: "assets/logo.png",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "plts",
      plt_file: {:no_warn, "plts/dialyzer.plt"}
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.4"},
      {:req, "~> 0.4.5"},
      {:ecto, "~> 3.10"},
      {:cachex, "~> 3.6"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      lint: [
        "credo --mute-exit-status",
        "dialyzer --ignore-exit-status",
        "format --check-formatted"
      ],
      docs: ["docs --formatter html"]
    ]
  end
end
