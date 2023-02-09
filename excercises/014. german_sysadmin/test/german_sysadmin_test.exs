defmodule GermanSysadminTest do
  use ExUnit.Case
  doctest GermanSysadmin

  test "Empty char list" do
    assert GermanSysadmin.sanitize('') === []
  end

  test "Char list with conversion" do
    assert GermanSysadmin.sanitize('helä wörlds') === 'helaewoerlds'
  end
end
