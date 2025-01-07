defmodule TextFormatter do
  @moduledoc """
  Utility module to format text for better readability in the terminal.
  """

  defp wrap_text(text, max_width) do
    text
    |> String.graphemes()
    |> Enum.reduce({[], 0}, fn char, {acc, line_length} ->
      cond do
        char == " " and line_length >= max_width ->
          {acc ++ ["\n"], 0}

        true ->
          {acc ++ [char], line_length + 1}
      end
    end)
    |> elem(0)
    |> Enum.join()
  end

  @doc """
    Prints the given text to the terminal, ensuring that lines do not exceed the specified
    maximum width. If a word would extend past the limit, it will move to the next line
    at the nearest whitespace.

    ## Parameters

    - `text` (string): The text to be printed.
    - `max_width` (integer, optional): The maximum number of characters allowed per line.
      Defaults to 80.

    ## Behavior

    This function uses the `wrap_text/2` helper to format the text by inserting line breaks
    at appropriate points (after spaces, before a word would exceed the line width). Once
    formatted, it prints the result directly to the terminal.
  """
  def print_with_wrap(text, max_width \\ 80) do
    text
    |> wrap_text(max_width)
    |> IO.puts()
  end
end
