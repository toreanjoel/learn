defmodule CityOfficeTest do
  use ExUnit.Case
  doctest CityOffice

  test "Duplicate X based on length added" do
    assert CityOffice.blanks(2) === "XX"
  end

  test "Trim/split, Uppercase each character" do
    assert CityOffice.letters("TEST") === ["T","E","S","T"]
  end

  test "Compare strig length to value, Lenth MORE" do
    assert CityOffice.check_length("TEST", 3) === {:error, 1}
  end

  test "Compare strig length to value, Lenth LESS" do
    assert CityOffice.check_length("TEST", 5) === :ok
  end

  test "Format Address - Map input" do
    address_map = %{ street: "hello", postal_code: "1", city: "world"}
    assert CityOffice.format_address(address_map) ===
      "HELLO\n1 WORLD\n"
  end

  test "Format Address - Tuple input" do
    address_tuple = {  "hello",  "2", "world"}
    assert CityOffice.format_address(address_tuple) ===
      "HELLO\n2 WORLD\n"
  end
end
