defmodule MantaGame do
  @moduledoc """
  Main module for MantaGame.
  """
  alias Utilities.TerminalUtils
  alias Story.GameIntroduction

  def start do
    TerminalUtils.clear_screen()

    IO.puts("Bienvenido a Manta!")
    IO.puts("Pulsa ENTER para comenzar...")
    IO.gets("")
    TerminalUtils.clear_screen()
    GameIntroduction.introduction()
  end
end
