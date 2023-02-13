defmodule NameBadgeTest do
  use ExUnit.Case
  doctest NameBadge

  # ## Example
  # iex> NameBadge.print(1, "Fullname", "title")
  # "[1] - Fullname - TITLE"

  # iex> NameBadge.print(nil, "Fullname", "title")
  # "Fullname - TITLE"

  # iex> NameBadge.print(1, "Fullname", nil)
  # "[1] - Fullname - OWNER"

  # iex> NameBadge.print(nil, "Fullname", nil)
  # "Fullname - OWNER"

  test "has id name and title" do
    assert NameBadge.print(1, "Fullname", "title") === "[1] - Fullname - TITLE"
  end

  test "has name and title - NO id" do
    assert NameBadge.print(nil, "Fullname", "title") === "Fullname - TITLE"
  end

  test "has name - NO id, NO title" do
    assert NameBadge.print(nil, "Fullname", nil) === "Fullname - OWNER"
  end

  test "has name and id - NO title" do
    assert NameBadge.print(1, "Fullname", nil) === "[1] - Fullname - OWNER"
  end
end
