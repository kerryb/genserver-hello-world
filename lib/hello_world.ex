defmodule HelloWorld do
  use GenServer

  def start_link(args) do
    GenServer.start_link __MODULE__, args, name: __MODULE__
  end

  def hello(n) do
    GenServer.cast __MODULE__, {:hello, n}
  end

  def handle_cast({:hello, n}, state) do
    :rand.uniform * 1900 |> round |> Process.sleep
    IO.puts "Hello World #{n}"
    {:noreply, state}
  end
end
