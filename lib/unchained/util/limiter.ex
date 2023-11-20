defmodule Unchained.Util.Limiter do
  use GenServer

  def check(key) do
    GenServer.call(__MODULE__, {:check, key})
  end

  def update(key, amount) do
    GenServer.call(__MODULE__, {:update, key, amount})
  end

  def reset(key, amount \\ 0) do
    GenServer.call(__MODULE__, {:reset, key, amount})
  end

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    ets_ref = :ets.new(:limiter, [:set, :protected])
    {:ok, %{ets_ref: ets_ref}}
  end

  @impl true
  def handle_call({:check, key}, _from, state) do
    ets_key = state[:ets_ref]
    value = :ets.lookup(ets_key, key)
    {:reply, value, state}
  end

  @impl true
  def handle_call({:update, key, amount}, _from, state) do
    ets_key = state[:ets_ref]

    new_value =
      case :ets.lookup(ets_key, key) do
        [{_, current_value}] -> current_value + amount
        _ -> amount
      end

    :ets.insert(ets_key, {key, new_value})
    {:reply, new_value, state}
  end

  @impl true
  def handle_call({:reset, key, amount}, _from, state) do
    ets_key = state[:ets_ref]
    :ets.insert(ets_key, {key, amount})
    {:reply, amount, state}
  end
end
