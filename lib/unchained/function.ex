defmodule Unchained.Function do
  @moduledoc """
  GenServer that executes some code and then optionally spawns and supervises additional Unchained Functions.
  """

  # use GenServer

  # def start_link(args) do
  #   GenServer.start_link(__MODULE__, args, name: __MODULE__)
  # end

  # def run(function, args, schema \\ nil) do
  #   GenServer.call(__MODULE__, {:run, function, args})
  # end

  # @impl true
  # def init(args) do
  #   {:ok, args}
  # end

  # @impl true
  # def handle_continue(continue_arg, state) do
  # end

  # @impl true
  # def handle_call({:run, function, args}, _from, state) do
  # end
end
