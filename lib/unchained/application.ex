defmodule Unchained.Application do
  @moduledoc false

  use Application
  alias Unchained.Util.Limiter

  @impl true
  def start(_type, _args) do
    children = [
      {DynamicSupervisor, name: UnchainedFunctionsDynamicSupervisor, strategy: :one_for_one},
      Limiter,
      {Cachex, name: :unchained}
    ]

    opts = [strategy: :one_for_one, name: Unchained.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
