defmodule LanguageListTest do
  use ExUnit.Case
  doctest LanguageList

  test "Create empty list" do
    assert LanguageList.new() === []
  end

  test "Add to list" do
    list = [1, 2, 3]
    assert LanguageList.add(list, 5) === [5, 1, 2, 3]
  end

  test "Remove from list" do
    list = [1, 2, 3]
    assert LanguageList.remove(list) === [2, 3]
  end

  test "Get first item in list" do
    list = [1, 2, 3]
    assert LanguageList.first(list) === 1
  end

  test "Count list" do
    list = [1, 2, 3]
    assert LanguageList.count(list) === 3
  end

  test "Check if functional (Elixir) exists" do
    list = ["Elixir", "JS", "C"]
    assert LanguageList.functional_list?(list) === true
  end
end
