defmodule Day1 do
  def frequency_from_file() do
    {:ok, content} = File.read("./priv/input.txt")
    frequency(content, "\n")
  end

  def first_repeated_frequency_from_file() do
    {:ok, content} = File.read("./priv/input.txt")
    first_repeated_frequency(content, "\n")
  end

  def frequency(changes, separator \\ ",") do
    changes
    |> String.split(separator, trim: true)
    |> Enum.map(&String.trim(&1))
    |> Enum.map(&String.to_integer(&1))
    |> Enum.reduce_while(0, fn x, acc ->
      {:cont, acc + x}
    end)
  end

  def first_repeated_frequency(changes, separator \\ ",") do
    [tail | _] =
      changes
      |> String.split(separator, trim: true)
      |> Enum.map(&String.trim(&1))
      |> Enum.map(&String.to_integer(&1))
      |> Stream.cycle()
      |> Enum.reduce_while([0], fn x, acc ->
        [head | tail] = acc
        acc = [x + head] ++ acc
        if (x + head) in tail, do: {:halt, acc}, else: {:cont, acc}
      end)

    tail
  end
end
