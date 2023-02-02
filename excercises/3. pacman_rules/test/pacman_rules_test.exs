defmodule PacmanRulesTest do
  use ExUnit.Case
  doctest PacmanRules

  test "Can eat ghost?" do
    has_power = true
    touching_ghost = true

    assert PacmanRules.eat_ghost?(has_power, touching_ghost) ==  true
  end

  test "Recieved Score?" do
    has_power = true
    touching_dot = false

    assert PacmanRules.score?(has_power, touching_dot) ==  true
  end

  test "Has lost?" do
    has_power = false
    touching_ghost = true

    assert PacmanRules.lose?(has_power, touching_ghost) ==  true
  end

  test "Has won?" do
    has_power = true
    touching_ghost = false
    all_dots_eaten = true

    assert PacmanRules.win?(all_dots_eaten, has_power, touching_ghost) == true
  end
end
