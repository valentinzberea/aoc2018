defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "frequency result after only positive changes" do
    assert Day1.frequency("+1, +1, +1") == 3
    assert Day1.frequency("+1, +1, -2") == 0
    assert Day1.frequency("-1, -2, -3") == -6
  end

  test "repeated frequency result" do
    assert Day1.first_repeated_frequency("+1, -1") == 0
    assert Day1.first_repeated_frequency("+3, +3, +4, -2, -4") == 10
    assert Day1.first_repeated_frequency("+7, +7, -2, -7, -4") == 14
    assert Day1.first_repeated_frequency("-6, +3, +8, +5, -6") == 5
  end
end
