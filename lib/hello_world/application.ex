defmodule HelloWorld.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {HelloWorld.Counter, {:hello, 1}},
      {HelloWorld.Timer, {}},
    ]

    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
