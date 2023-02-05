defmodule KitchenCalculator do
  @moduledoc """
  Documentation for `KitchenCalculator`.

  Instructions
  While preparing to bake cookies for your friends, you have found that you have to convert some of the measurements used in the recipe. Being only familiar with the metric system, you need to come up with a way to convert common US baking measurements to milliliters (mL) for your own ease.

  Use this conversion chart for your solution:

  Unit to convert	volume	in milliliters (mL)
  mL	1	1
  US cup	1	240
  US fluid ounce	1	30
  US teaspoon	1	5
  US tablespoon	1	15
  Being a talented programmer in training, you decide to use milliliters as a transition unit to facilitate the conversion from any unit listed to any other (even itself).

  1. Get the numeric component from a volume-pair
  Implement the KitchenCalculator.get_volume/1 function. Given a volume-pair tuple, it should return just the numeric component.

  KitchenCalculator.get_volume({:cup, 2.0})
  # => 2.0
  2. Convert the volume-pair to milliliters
  Implement the KitchenCalculator.to_milliliter/1 function. Given a volume-pair tuple, it should convert the volume to milliliters using the conversion chart.

  Use multiple function clauses and pattern matching to create the functions for each unit.
  The atoms used to denote each unit are:
  :cup, :fluid_ounce, :teaspoon, :tablespoon, :milliliter.
  Return the result of the conversion wrapped in a tuple.

  KitchenCalculator.to_milliliter({:cup, 2.5})
  # => {:milliliter, 600.0}

  3. Convert the milliliter volume-pair to another unit
  Implement the KitchenCalculator.from_milliliter/2 function.
  Given a volume-pair tuple and the desired unit,
  it should convert the volume to the desired unit using the conversion chart.

  Use multiple function clauses and pattern matching to create the functions for each unit. The atoms used to denote each unit are: :cup, :fluid_ounce, :teaspoon, :tablespoon, :milliliter

  KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup)
  # => {:cup, 5.5}

  4. Convert from any unit to any unit
  Implement the KitchenCalculator.convert/2 function. Given a volume-pair tuple and the desired unit, it should convert the given volume to the desired unit.

  KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
  # => {:tablespoon, 3.0}
  """

  # ml converted to one of the other metric conversions
  @to_ml %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15,
  }

  @doc """
    Get the value off a passed unit value tuple

    ## Example
      iex> KitchenCalculator.get_volume({:cup, 2.0})
      2.0
  """
  def get_volume({_unit, value}) do
    value
  end

  @doc """
    Convert any unit to milliliter

    ## Example
      iex> KitchenCalculator.to_milliliter({:cup, 2.5})
      {:milliliter, 600.0}

      iex> KitchenCalculator.to_milliliter({:fluid_ounce, 2.5})
      {:milliliter, 75.0}

      iex> KitchenCalculator.to_milliliter({:teaspoon, 2.5})
      {:milliliter, 12.5}

      iex> KitchenCalculator.to_milliliter({:tablespoon, 2.5})
      {:milliliter, 37.5}

      iex> KitchenCalculator.to_milliliter({:milliliter, 2.5})
      {:milliliter, 2.5}


  """
  def to_milliliter({unit, value}) when unit === :cup,  do: {:milliliter, value * @to_ml[unit]}
  def to_milliliter({unit, value}) when unit === :fluid_ounce,  do: {:milliliter, value * @to_ml[unit]}
  def to_milliliter({unit, value}) when unit === :teaspoon,  do: {:milliliter, value * @to_ml[unit]}
  def to_milliliter({unit, value}) when unit === :tablespoon,  do: {:milliliter, value * @to_ml[unit]}
  def to_milliliter({unit, value}) when unit === :milliliter,  do: {:milliliter, value * @to_ml[unit]}

  @doc """
    Convert any unit from milliliter

    ## Example
      iex> KitchenCalculator.from_milliliter({:milliliter, 600}, :cup)
      {:cup, 2.5}

      iex> KitchenCalculator.from_milliliter({:milliliter, 600}, :fluid_ounce)
      {:fluid_ounce, 20.0}

      iex> KitchenCalculator.from_milliliter({:milliliter, 600}, :teaspoon)
      {:teaspoon, 120.0}

      iex> KitchenCalculator.from_milliliter({:milliliter, 600}, :tablespoon)
      {:tablespoon, 40.0}

      iex> KitchenCalculator.from_milliliter({:milliliter, 600}, :milliliter)
      {:milliliter, 600.0}


  """
  def from_milliliter({ml_unit, value}, unit_to) when unit_to === :cup,  do: {unit_to, value / @to_ml[unit_to]}
  def from_milliliter({ml_unit, value}, unit_to) when unit_to === :fluid_ounce,  do: {unit_to, value / @to_ml[unit_to]}
  def from_milliliter({ml_unit, value}, unit_to) when unit_to === :teaspoon,  do: {unit_to, value / @to_ml[unit_to]}
  def from_milliliter({ml_unit, value}, unit_to) when unit_to === :tablespoon,  do: {unit_to, value / @to_ml[unit_to]}
  def from_milliliter({ml_unit, value}, unit_to) when unit_to === :milliliter,  do: {unit_to, value / @to_ml[unit_to]}

  @doc """
    Convert from one value to another

    ## Example
      iex> KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
      {:tablespoon, 3.0}
  """
  def convert({unit_from, value}, unit_to) do
    {_, value} = to_milliliter({unit_from, value})
    {unit_to, value / @to_ml[unit_to]}
  end
end
