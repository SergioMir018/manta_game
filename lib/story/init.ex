defmodule Story.Init do
  @moduledoc """
  Sets global state for the game
  """
  alias Servers.GameServer
  alias Utilities.TerminalUtils

  def init do
    set_name()
    set_gender()
  end

  def set_name do
    IO.write("¿Cómo te llamaras?: ")
    name = IO.gets("") |> String.trim()
    GameServer.set_name(name)
    TerminalUtils.clear_screen()
  end

  def set_gender do
    genders = ["Hombre", "Mujer"]

    IO.puts("Selecciona tu género:")
    render_gender_options(genders)

    selected_option = IO.gets("") |> String.trim()

    gender =
      case selected_option do
        "1" ->
          :man

        "2" ->
          :woman

        _ ->
          TerminalUtils.clear_screen()
          IO.puts("Opción no válida, selecciona 1 o 2")
          set_gender()
      end

    GameServer.set_gender(gender)
    TerminalUtils.clear_screen()
  end

  defp render_gender_options(genders) do
    genders
    |> Enum.with_index()
    |> Enum.each(fn {gender, index} ->
      IO.puts("#{index + 1} ➤ #{gender}")
    end)
  end
end
