defmodule MantaGame do
  @moduledoc """
  Main module for MantaGame.
  """
  def start do
    IO.puts("Bienvenido a Manta!")
    IO.puts("Pulsa ENTER para comenzar...")
    IO.gets("")
    TerminalUtils.clear_screen()
    Narrative.introduction()
  end
end

defmodule Narrative do
  @moduledoc """
  Module containing major narrative components
  """

  def introduction do
    TextFormatter.print_with_wrap(
      "Hace ya una semana que partiste desde la capital bajo órdenes de resolver una serie de disturbios enun pueblo provinciano que pidió ayuda al verse incapaz de manejar el asunto.\n"
    )

    IO.puts("Pulsa ENTER para continuar...")
    IO.gets("")
    TerminalUtils.clear_screen()
    travel_to_town()
  end

  def travel_to_town do
    TextFormatter.print_with_wrap(
      "El carruaje en el que viajas avanza lentamente por un angosto camino muy irregular y mal cuidado, rodeado de densos árboles. Justo a la llegada de un hueco en la espesura, a lo lejos, las primeras casas de Manta se perfilan como sombras bajo un cielo gris y triste, que se ocultan detrás de una poco usual neblina a la que no estás acostumbrad@. La sensación de quietud en el aire resulta ser inquietante, y el silencio de la ruta solo es roto por el sonido de las ruedas del carruaje sobre el barro y el choque regular contra las piedras del camino.\n"
    )

    IO.puts("Pulsa ENTER para continuar...")
    IO.gets("")
    TerminalUtils.clear_screen()
    first_entry_town()
  end

  def first_entry_town do
    TextFormatter.print_with_wrap(
      "Una hora pasó desde que se pudo discernir el poblado entre la espesura del bosque hasta que por fin llegas al pueblo. Manta es un pueblo típico de provincia, casas chicas en un estado casi decente que no pasan de más de dos pisos de altura y las calles no están asfaltadas con exepción de la calle principal que da entrada al pueblo.\n"
    )

    IO.puts("Pulsa ENTER para continuar...")
    IO.gets("")
    TerminalUtils.clear_screen()

    TextFormatter.print_with_wrap(
      "El carruaje sigue un poco más adelante, y sigues fijandote en lo que te rodea, pero pasa algo raro. Sigues sin escuchar ruido, no ves a nadie en las calles del pueblo. ¿Dónde está el bullicio característico de los pueblos? ¿Dónde están los habitantes de Manta? Cuando estabas a la entrada del valle ya resultaba raro el silencio, pero esta quietud dentro del pueblo es casi escalofriante, parece un pueblo fantasma.\n"
    )

    IO.puts("Pulsa ENTER para continuar...")
    IO.gets("")
    TerminalUtils.clear_screen()

    sheriff_first_meet()
  end

  def sheriff_first_meet do
    TextFormatter.print_with_wrap(
      "El carruaje para, te bajas y entre la espesa niebla logras distinguir a una figura corpulenta más alta que tú sosteniendo una farola. Lleva uniforme de la policía muy desgastado, que refleja en cierta manera los años que lleva de servicio, pero en vez de el clásico casco de chimenea reglamentario, el sujeto trae un sombrero de copa un poco maltratado pero en considerablemente mejor estado que el resto de la indumentaria.\n"
    )

    TextFormatter.print_with_wrap(
      "Sin decir una palabra baja tu equipaje del carruaje y le hace una seña al conductor para que se ponga en marcha nuevamente. Se para frente a tí con un rostro serio y te mira de arriba ha abajo, como si te estuviera mediendo de alguna forma, puedes sentir que está siendo cauteloso antes de siquiera dirigirte la palabra. Se estira empidando el pecho y mirandote fijamente a los ojos.\n"
    )

    TextFormatter.print_with_wrap("Policía desconocido -> 'Bienvenido detective'")
    TextFormatter.print_with_wrap("Dice sin mucha calidez.")

    IO.gets("")

    TextFormatter.print_with_wrap(
      "Policía desconocido -> 'Lo estabamos esperando. Yo soy el Alguacil de este pueblo. Me puede llamar Rand. Pasemos dentro de la comisaría, necesitamos hablar'\n"
    )
  end
end
