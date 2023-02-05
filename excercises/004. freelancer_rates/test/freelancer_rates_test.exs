defmodule FreelancerRatesTest do
  use ExUnit.Case
  doctest FreelancerRates

  test "Daily rate over 8h" do
    assert FreelancerRates.daily_rate(10) === 80.0
  end

  test "Discount towards an amount" do
    assert FreelancerRates.apply_discount(100, 10) === 90.0
  end

  test "Monthly rate against 22 billible days and discount" do
    assert FreelancerRates.monthly_rate(77, 10.5) === 12130
  end

  test "Days in budget based off hourly rate, considering discount" do
    assert FreelancerRates.days_in_budget(10000, 50, 30) === 35.7
  end
end
