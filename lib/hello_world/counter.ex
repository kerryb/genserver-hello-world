defmodule  HelloWorld.Counter do
  use GenServer

  def start_link({name, start_at}) do
    GenServer.start_link __MODULE__, start_at, name: name
  end

  def next(name) do
    GenServer.call name, :next
  end

  def handle_call(:next, _from, count) do
    {:reply, count, count + 1}
  end
end
