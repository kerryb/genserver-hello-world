defmodule  HelloWorld.Counter do
  use GenServer

  def handle_call(:next, _from, count) do
    {:reply, count, count + 1}
  end
end
