defmodule WineCellarTest do
  use ExUnit.Case
  doctest WineCellar

  test "Get color explain" do
    assert WineCellar.explain_colors === [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  test "Filter against key" do
    cellar =  [
      red: {"name #1", 2000, "country 1"},
      green: {"name #2", 1993, "country 2"},
      blue: {"name #3", 1560, "country 3"},
      green: {"name #4", 1992, "country 4"}
    ]

    assert WineCellar.filter(cellar, :green) ===
      [{"name #2", 1993, "country 2"}, {"name #4", 1992, "country 4"}]
  end

  test "Filter against year" do
    cellar =  [
      red: {"name #1", 2000, "country 1"},
      green: {"name #2", 1993, "country 2"},
      blue: {"name #3", 1560, "country 3"},
      green: {"name #4", 1992, "country 4"}
    ]

    assert WineCellar.filter(cellar, :green, year: 1993) ===
      [{"name #2", 1993, "country 2"}]
  end

  test "Filter against country" do
    cellar =  [
      red: {"name #1", 2000, "country 1"},
      green: {"name #2", 1993, "country 2"},
      blue: {"name #3", 1560, "country 3"},
      green: {"name #4", 1992, "country 4"}
    ]

    assert WineCellar.filter(cellar, :blue, country: "country 3") ===
      [{"name #3", 1560, "country 3"}]
  end
end
