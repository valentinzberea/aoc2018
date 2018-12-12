defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "id has a letter appearing 3 times" do
    id = "aava"
    assert Day2.contains_multiple_letters(id) == [3]
  end

  test "id has a letter appearing 2 times" do
    id = "ava"
    assert Day2.contains_multiple_letters(id) == [2]
  end

  test "id has no multiple letters" do
    id = "avb"
    assert Day2.contains_multiple_letters(id) == []
  end

  test "checksum" do
    ids = """
    aa
    bbb
    aabbccc
    """

    assert Day2.checksum(ids) == 4
  end

  test "common letters" do
    input = """
    axyde
    abcde
    fghij
    klmno
    pqrst
    fguij
    axcye
    wvxyz
    """

    assert "fgij" == Day2.common_letters(input)
  end
end
