defmodule LasagnaTest do
  use ExUnit.Case
  doctest Lasagna

  test "Expected time in oven is a number" do
    assert Lasagna.expected_minutes_in_oven() == 40
  end

  test "Lasagna is done" do
    assert Lasagna.alarm() == "Ding!"
  end

  test "Remaining time left" do
    input_value = 10
    assert Lasagna.remaining_minutes_in_oven(input_value) ==
      Lasagna.expected_minutes_in_oven - input_value
  end

  test "Preperation time based off layers done" do
    input_value = 3
    layer_time = 2
    assert Lasagna.preparation_time_in_minutes(input_value) ==
      input_value * layer_time
  end

  test "Total time based on layers and lapsed time" do
    layers = 4
    lapsed_time = 50
    assert Lasagna.total_time_in_minutes(layers, lapsed_time) ==
      Lasagna.preparation_time_in_minutes(layers) + lapsed_time
  end

end
