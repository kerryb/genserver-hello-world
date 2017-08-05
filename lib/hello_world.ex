defmodule HelloWorld do
  def hello do
    IO.puts "Hello World #{HelloWorld.Counter.next :hello}"
  end
end
