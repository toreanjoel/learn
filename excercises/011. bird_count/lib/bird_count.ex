defmodule BirdCount do
  @moduledoc """
  Documentation for `BirdCount`.

  Instructions
  You're an avid bird watcher that keeps track of how many birds have visited your garden on any given day.

  You decided to bring your bird watching to a new level and implement a few tools that will help you track and process the data.

  You have chosen to store the data as a list of integers. The first number in the list is the number of birds that visited your garden today, the second yesterday, and so on.

  1. Check how many birds visited today
  Implement the BirdCount.today/1 function. It should take a list of daily bird counts and return today's count. If the list is empty, it should return nil.

  BirdCount.today([2, 5, 1])
  # => 2
  2. Increment today's count
  Implement the BirdCount.increment_day_count/1 function. It should take a list of daily bird counts and increment the today's count by 1. If the list is empty, return [1].

  BirdCount.increment_day_count([4, 0, 2])
  # => [5, 0, 2]

  3. Check if there was a day with no visiting birds

  Implement the BirdCount.has_day_without_birds?/1 function. It should take a list of daily bird counts. It should return true if there was at least one day when no birds visited the garden, and false otherwise.

  BirdCount.has_day_without_birds?([2, 0, 4])
  # => true

  BirdCount.has_day_without_birds?([3, 8, 1, 5])
  # => false

  4. Calculate the total number of visiting birds
  Implement the BirdCount.total/1 function. It should take a list of daily bird counts and return the total number that visited your garden since you started collecting the data.

  BirdCount.total([4, 0, 9, 0, 5])
  # => 18

  5. Calculate the number of busy days
  Some days are busier than others. A busy day is one where five or more birds have visited your garden.

  Implement the BirdCount.busy_days/1 function. It should take a list of daily bird counts and return the number of busy days.

  BirdCount.busy_days([4, 5, 0, 0, 6])
  # => 2
  """

  @doc """
    Return the first item in the list, if empty list return nothing

    ## Examples
      iex> BirdCount.today([])
      nil

      iex> BirdCount.today([3, 5, 4])
      3
  """
  def today([]), do: nil
  def today([today | _rest]), do: today

  @doc """
    Incremnt the first item in the list by 1, return 1 index list item as [1] otherwise

    ## Exmaples
      iex> BirdCount.increment_day_count([])
      [1]

      iex> BirdCount.increment_day_count([4, 3, 7])
      [5, 3, 7]
  """
  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  @doc """
    Check if there was a day with 0 as a value, return false otherwise

    ## Exmaples
      iex> BirdCount.has_day_without_birds?([])
      false

      iex> BirdCount.has_day_without_birds?([4, 5, 0, 1])
      true
  """
  def has_day_without_birds?([]), do: false # check if the list is empty
  def has_day_without_birds?([0 | _rest]), do: true # check if the head is 0 -> break out of recursion
  def has_day_without_birds?([today | rest]), do: has_day_without_birds?(rest) # try again until we checked entire list

  @doc """
    Add up all values in a list

    ## Exmaples
      iex> BirdCount.total([])
      0

      iex> BirdCount.total([4, 5, 0, 1])
      10
  """
  def total([]), do: 0
  def total([today | rest]), do: today + total(rest)

  @doc """
    Check if any of the items in the list are more than or equal to 5, increment a count of them

    ## Exmaples
      iex> BirdCount.busy_days([])
      0

      iex> BirdCount.busy_days([4, 5, 0, 1])
      1
  """
  def busy_days([]), do: 0
  def busy_days([today | rest]) when today >= 5, do: busy_days(rest) + 1
  def busy_days([_today | rest]), do: busy_days(rest)
end
