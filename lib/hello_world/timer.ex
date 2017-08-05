defmodule  HelloWorld.Timer do
  use GenServer

  def start_link(args) do
    GenServer.start_link __MODULE__, args
  end

  def init(_args) do
    send self(), :tick
    {:ok, nil}
  end

  def handle_info(:tick, state) do
    IO.puts "TICK"
    HelloWorld.Counter.next(:hello) |> HelloWorld.hello
    Process.send_after self(), :tick, 1_000
    IO.puts "TOCK"
    {:noreply, state}
  end
end
