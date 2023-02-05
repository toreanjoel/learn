defmodule GuessingGameTest do
  use ExUnit.Case
  doctest GuessingGame

  test "Passing no values making a guess" do
    assert GuessingGame.compare(2) === "Make a guess"
  end

  test "Passing no values making a guess, passing atom" do
    assert GuessingGame.compare(:no_guess) === "Make a guess"
  end

  test "Correct Guess" do
    assert GuessingGame.compare(2, 2) === "Correct"
  end

  test "Too low" do
    assert GuessingGame.compare(2, 0) === "Too low"
  end

  test "Too high" do
    assert GuessingGame.compare(2, 5) === "Too high"
  end

  test "One too much" do
    assert GuessingGame.compare(2, 3) === "So close"
  end

  test "One too little" do
    assert GuessingGame.compare(2, 1) === "So close"
  end
end
