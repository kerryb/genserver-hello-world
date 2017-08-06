defmodule HelloWorld do
  use GenServer

  def hello(n) do
    GenServer.start HelloWorld, n
  end

  def init(n) do
    GenServer.cast self(), :hello
    {:ok, n}
  end

  def handle_cast(:hello, n) do
    :rand.uniform * 1900 |> round |> Process.sleep
    IO.puts "Hello World #{n}"
    {:stop, :normal, n}
  end
end
