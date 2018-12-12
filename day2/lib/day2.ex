defmodule Day2 do
  def checksum_from_file() do
    {:ok, content} = File.read("./priv/input.txt")
    checksum(content)
  end

  def checksum(input, separator \\ "\n") do
    multiple_occurences =
      input
      |> String.split(separator, trim: true)
      |> Enum.map(&String.trim(&1))
      |> Enum.map(&contains_multiple_letters(&1))

    count_of_2 = multiple_occurences |> Enum.count(&(2 in &1))
    count_of_3 = multiple_occurences |> Enum.count(&(3 in &1))

    count_of_2 * count_of_3
  end

  def contains_multiple_letters(id) do
    id
    |> String.codepoints()
    |> Enum.group_by(& &1)
    |> Map.values()
    |> Enum.map(&Enum.count(&1))
    |> Enum.group_by(& &1)
    |> Map.keys()
    |> Enum.filter(&(&1 in [2, 3]))
  end

  def common_letters_from_file() do
    {:ok, content} = File.read("./priv/input.txt")
    common_letters(content)
  end

  def common_letters(input, separator \\ "\n") do
    ids =
      input
      |> String.split(separator, trim: true)
      |> Enum.map(&String.trim(&1))

    ids
    |> Enum.flat_map(fn x -> ids |> Enum.map(fn y -> [x, y] end) end)
    |> Enum.filter(fn [x, y] -> String.myers_difference(x, y) |> Enum.count() == 4 end)
    |> Enum.filter(fn [x, y] ->
      String.myers_difference(x, y)
      |> Enum.find(fn {t, _} -> t == :ins end)
      |> Tuple.to_list()
      |> Enum.at(1)
      |> String.length() == 1
    end)
    |> Enum.at(0)
    |> common_letters_result()
  end

  defp common_letters_result([a, b]) do
    String.myers_difference(a, b)
    |> Enum.filter(fn {t, _} -> t == :eq end)
    |> Enum.map_join(fn {_, str} -> str end)
  end
end
