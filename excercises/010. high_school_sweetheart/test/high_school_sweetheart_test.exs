defmodule HighSchoolSweetheartTest do
  use ExUnit.Case
  doctest HighSchoolSweetheart

  test "Get first letter trimmed spacing" do
    assert HighSchoolSweetheart.first_letter(" First") === "F"
  end

  test "Get initial capitalized" do
    assert HighSchoolSweetheart.initial("First") === "F."
  end

  test "Get initials from first and last name" do
    assert HighSchoolSweetheart.initials("First name") === "F. N."
  end
end
