defmodule BirdCountTest do
  use ExUnit.Case
  doctest BirdCount

  test "get first item in list - empty list" do
    assert BirdCount.today([]) === nil
  end

  test "get first item in list" do
    assert BirdCount.today([4, 3, 5]) === 4
  end

  test "Increment first item by 1 - empty list" do
    assert BirdCount.increment_day_count([]) === [1]
  end

  test "Increment first item by 1" do
    assert BirdCount.increment_day_count([4, 3, 5]) === [5, 3, 5]
  end

  test "Check any item equal to zero - empty list" do
    assert BirdCount.has_day_without_birds?([]) === false
  end

  test "Check any item equal to zero - true" do
    assert BirdCount.has_day_without_birds?([1, 4, 5, 0]) === true
  end

  test "Work out total of all items in list - empty list" do
    assert BirdCount.total([]) === 0
  end

  test "Work out total of all items in list" do
    assert BirdCount.total([1, 4, 5, 0]) === 10
  end

  test "Check indice and increment a count if the value is more or equal to 5 - empty list" do
    assert BirdCount.busy_days([]) === 0
  end

  test "Check indice and increment a count if the value is more or equal to 5" do
    assert BirdCount.busy_days([5, 4, 7, 2, 2]) === 2
  end
end
