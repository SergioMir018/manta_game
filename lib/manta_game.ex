defmodule MantaGame do
  @moduledoc """
  Main module for MantaGame.
  """
  require Logger
  alias Utilities
  alias Story
  alias Servers

  def main(_args) do
    start()
  end

  def start do
    case Servers.GameServer.start_link() do
      {:ok, pid} ->
        Logger.info("GenServer: #{inspect(pid)} online")

        Utilities.TerminalUtils.clear_screen()

        IO.puts("Bienvenido a Manta!")
        IO.puts("Pulsa ENTER para comenzar...")
        IO.gets("")
        Utilities.TerminalUtils.clear_screen()
        Story.Init.init()
        Story.GameIntroduction.introduction()

      {:error, reason} ->
        Logger.error("Error while initiating GameServer beacuse: #{reason}")
    end
  end
end
