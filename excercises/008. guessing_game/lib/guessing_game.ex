defmodule GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`.

  Instructions
  You are creating a trivial online game where a friend can guess a secret number. You want to give some feedback, but not give away the answer with a guess. You need to devise a function to provide different responses depending on how the guess relates to the secret number.

  Condition	Response
  When the guess matches the secret number	"Correct"
  When the guess is one more or one less than the secret number	"So close"
  When the guess is greater than the secret number	"Too high"
  When the guess is less than the secret number	"Too low"
  When a guess isn't made	"Make a guess"
  All guesses and secret numbers are integer numbers.

  1. Make the response when the guess matches the secret number
  Implement the compare/2 function which takes two arguments, secret_number and guess, which are both integers.

  GuessingGame.compare(5, 5)
  # => "Correct"

  2. Make the response when the guess is greater than the secret number
  Modify the compare function to respond to guesses that are higher than the secret number.
  GuessingGame.compare(5, 8)
  # => "Too high"

  3. Make the response when the guess is less than the secret number
  Modify the compare function to respond to guesses that are lower than the secret number.

  GuessingGame.compare(5, 2)
  # => "Too low"

  4. Make the responses when the guess is one more or one less than the secret number
  Modify the compare function to respond to guesses that are close to the secret number.

  GuessingGame.compare(5, 6)
  # => "So close"
  GuessingGame.compare(5, 4)
  # => "So close"

  5. Make the response when there is no guess
  Modify the compare function to respond to a lack of guess.

  GuessingGame.compare(5)
  # => "Make a guess"

  GuessingGame.compare(5, :no_guess)
  # => "Make a guess"
  """

  @doc """
    Function pattern match against the compare for each of the types

    ## Example
      iex> GuessingGame.compare(5)
      "Make a guess"

      iex> GuessingGame.compare(5, 5)
      "Correct"

      iex> GuessingGame.compare(5, 3)
      "Too low"

      iex> GuessingGame.compare(5, 8)
      "Too high"

      iex> GuessingGame.compare(5, 6)
      "So close"

      iex> GuessingGame.compare(5, 4)
      "So close"
  """
  def compare(_, guess \\ :no_guess)
  def compare(_, guess) when guess === :no_guess, do: "Make a guess"

  def compare(secret_number, guess) when secret_number === guess do
    "Correct"
  end

  def compare(secret_number, guess) when guess > secret_number do
    case one_away secret_number, guess do
      true -> "So close"
      _ -> "Too high"
    end
  end

  def compare(secret_number, guess) when guess < secret_number do
    case one_away secret_number, guess do
      true -> "So close"
      _ -> "Too low"
    end
  end

  @neg_one -1
  @pos_one 1
  # condition to chekc that we are one away in both directions
  defp one_away(secret_number, guess) do
    close_check = secret_number - guess === @pos_one || secret_number - guess === @neg_one
  end
end
