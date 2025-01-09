defmodule Story.Init do
  @moduledoc """
  Sets global state for the game
  """
  alias Servers.GameServer
  alias Utilities.TerminalUtils
  alias Utilities.TextFormatter

  def init do
    set_name()
    set_gender()
    set_cop_type()
  end

  defp set_name do
    IO.write("¿Cómo te llamaras?: ")

    name = IO.gets("") |> String.trim()

    case name do
      "" ->
        TerminalUtils.clear_screen()
        IO.puts("Ingresa un nombre para tu personaje:")
        set_name()

      _ ->
        :ok
    end

    GameServer.set_name(name)
    TerminalUtils.clear_screen()
  end

  defp set_gender do
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

  defp set_cop_type do
    types = [
      "El detective #1 del distrito central de la capital",
      "No destacas por tu historial, pero tratas de hacer tu trabajo lo mejor que puedes",
      "La desgracia del cuerpo policial",
      "No existe un policia más corrupto que tú"
    ]

    IO.puts("Selecciona qué tipo de detective eres:")
    render_cop_type_options(types)
    selected_option = IO.gets("") |> String.trim()

    cop_type =
      case selected_option do
        "1" ->
          :normal_cop

        "2" ->
          :good_cop

        "3" ->
          :bad_cop

        "4" ->
          :corrupt_cop

        _ ->
          TerminalUtils.clear_screen()
          IO.puts("Selecciona una opción válida")
          set_cop_type()
      end

    GameServer.set_cop_type(cop_type)
    TerminalUtils.clear_screen()
  end

  defp render_cop_type_options(types) do
    types
    |> Enum.with_index()
    |> Enum.each(fn {type, index} ->
      TextFormatter.print_with_wrap("#{index + 1} ➤ #{type}")
    end)
  end
end
