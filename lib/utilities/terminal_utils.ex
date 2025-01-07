defmodule Utilities.TerminalUtils do
  @moduledoc """
  Utility functions for terminal operations.
  """

  @doc """
  Clears the terminal screen by sending the ANSI escape code.
  """
  def clear_screen do
    IO.write(IO.ANSI.clear())
    IO.write(IO.ANSI.home())
  end
end
