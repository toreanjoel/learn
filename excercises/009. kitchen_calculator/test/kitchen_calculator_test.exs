defmodule KitchenCalculatorTest do
  use ExUnit.Case
  doctest KitchenCalculator

  @get_colume 12.0
  @to_ml_value 2.5
  @from_ml_value 600.0

  test "Get value from tuple volume" do
    assert KitchenCalculator.get_volume({:cup, @get_colume}) === @get_colume
  end

  test "Convert from cup, to milliliter" do
    assert KitchenCalculator.to_milliliter({:cup, @to_ml_value}) === {:milliliter, 600.0}
  end

  test "Convert from fluid_ounce, to milliliter" do
    assert KitchenCalculator.to_milliliter({:fluid_ounce, @to_ml_value}) === {:milliliter, 75.0}
  end

  test "Convert from teaspoon, to milliliter" do
    assert KitchenCalculator.to_milliliter({:teaspoon, @to_ml_value}) === {:milliliter, 12.5}
  end

  test "Convert from tablespoon, to milliliter" do
    assert KitchenCalculator.to_milliliter({:tablespoon, @to_ml_value}) === {:milliliter, 37.5}
  end

  test "Convert from milliliter, to milliliter" do
    assert KitchenCalculator.to_milliliter({:milliliter, @to_ml_value}) === {:milliliter, @to_ml_value}
  end

  test "Convert to cup, from milliliter" do
    assert KitchenCalculator.from_milliliter({:milliliter, @from_ml_value}, :cup) === {:cup, 2.5}
  end

  test "Convert to fluid_ounce, from milliliter" do
    assert KitchenCalculator.from_milliliter({:milliliter, @from_ml_value}, :fluid_ounce) === {:fluid_ounce, 20.0}
  end

  test "Convert to teaspoon, from milliliter" do
    assert KitchenCalculator.from_milliliter({:milliliter, @from_ml_value}, :teaspoon) === {:teaspoon, 120.0}
  end

  test "Convert to tablespoon, from milliliter" do
    assert KitchenCalculator.from_milliliter({:milliliter, @from_ml_value}, :tablespoon) === {:tablespoon, 40.0}
  end

  test "Convert to milliliter, from milliliter" do
    assert KitchenCalculator.from_milliliter({:milliliter, @from_ml_value}, :milliliter) === {:milliliter, @from_ml_value}
  end

  test "Convert to UNIT, from UNIT" do
    teaspoon = 9.0
    tablespoon = 3.0
    assert KitchenCalculator.convert({:teaspoon, teaspoon}, :tablespoon) === {:tablespoon, tablespoon}
  end

end
