defmodule MantaGame do
  @moduledoc """
  Main module for MantaGame.
  """
  alias Utilities
  alias Story
  alias Servers

  def main(_args) do
    start()
  end

  def start do
    case Servers.GameServer.start_link() do
      {:ok, _pid} ->
        Utilities.TerminalUtils.clear_screen()

        IO.puts("Bienvenido a Manta!")
        IO.puts("Pulsa ENTER para comenzar...")
        IO.gets("")
        Utilities.TerminalUtils.clear_screen()
        Story.Init.init()
        Story.GameIntroduction.introduction()

      {:error, reason} ->
        IO.puts("Error al iniciar el servidor: #{inspect(reason)}")
    end
  end
end
