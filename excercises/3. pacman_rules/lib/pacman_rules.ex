defmodule PacmanRules do
  @moduledoc """
    Documentation for `PacmanRules`.

    Instructions
    In this exercise, you need to translate some rules from the classic game Pac-Man into Elixir functions.

    You have four rules to translate, all related to the game states.

    Don't worry about how the arguments are derived, just focus on combining the arguments to return the intended result.

    1. Define if Pac-Man eats a ghost
    Define the Rules.eat_ghost?/2 function that takes two arguments (if Pac-Man has a power pellet active and if Pac-Man is touching a ghost) and returns a boolean value if Pac-Man is able to eat the ghost. The function should return true only if Pac-Man has a power pellet active and is touching a ghost.

    Rules.eat_ghost?(false, true)
    # => false

    2. Define if Pac-Man scores
    Define the Rules.score?/2 function that takes two arguments (if Pac-Man is touching a power pellet and if Pac-Man is touching a dot) and returns a boolean value if Pac-Man scored. The function should return true if Pac-Man is touching a power pellet or a dot.

    Rules.score?(true, true)
    # => true

    3. Define if Pac-Man loses
    Define the Rules.lose?/2 function that takes two arguments (if Pac-Man has a power pellet active and if Pac-Man is touching a ghost) and returns a boolean value if Pac-Man loses. The function should return true if Pac-Man is touching a ghost and does not have a power pellet active.

    Rules.lose?(false, true)
    # => true

    4. Define if Pac-Man wins
    Define the Rules.win?/3 function that takes three arguments (if Pac-Man has eaten all of the dots, if Pac-Man has a power pellet active, and if Pac-Man is touching a ghost) and returns a boolean value if Pac-Man wins. The function should return true if Pac-Man has eaten all of the dots and has not lost based on the arguments defined in part 3.

    Rules.win?(false, true, false)
    # => false
  """

  @doc """
    Can eat ghost - check power_up, check touching ghost

    ## Examples
      iex> PacmanRules.eat_ghost?(false, true)
      false
  """
  def eat_ghost?(power_up, touching_ghost) do
    power_up && touching_ghost
  end

  @doc """
    Should add to score - check power_up, check touching dot

    ## Examples
      iex> PacmanRules.score?(true, true)
      true
  """
  def score?(power_up, dot) do
    power_up || dot
  end

  @doc """
    Has lost - check power_up, check touching ghost

    ## Examples
      iex> PacmanRules.lose?(false, true)
      true
  """
  def lose?(power_up, touching_ghost) do
    power_up == false && touching_ghost
  end

  @doc """
    Has won - check all dots eaten, check power_up, check touching ghost

    ## Examples
      iex> PacmanRules.win?(false, true, false)
      false
  """
  def win?(all_dots_eaten, power_up, touching_ghost) do
    !(lose?(power_up, touching_ghost)) && all_dots_eaten
  end
end
