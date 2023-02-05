defmodule Lasagna do
  @moduledoc """
    Documentation for `Lasagn`.

    Instructions
    In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

    You have five tasks, all related to the time spent cooking the lasagna.

    1. Define the expected oven time in minutes
    Define the Lasagna.expected_minutes_in_oven/0 function that does not take any arguments and returns how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

    Lasagna.expected_minutes_in_oven()
    # => 40

    2. Calculate the remaining oven time in minutes
    Define the Lasagna.remaining_minutes_in_oven/1 function that takes the actual minutes the lasagna has been in the oven as an argument and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

    Lasagna.remaining_minutes_in_oven(30)
    # => 10

    3. Calculate the preparation time in minutes
    Define the Lasagna.preparation_time_in_minutes/1 function that takes the number of
    layers you added to the lasagna as an argument and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

    Lasagna.preparation_time_in_minutes(2)
    # => 4

    4. Calculate the total working time in minutes
    Define the Lasagna.total_time_in_minutes/2 function that takes two arguments:
    The first argument is the number of layers you added to the lasagna,
    and the second argument is the number of minutes the lasagna has been in the oven.
    The function should return how many minutes in total you've worked on cooking the lasagna,
    which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

    Lasagna.total_time_in_minutes(3, 20)
    # => 26

    5. Create a notification that the lasagna is ready
    Define the Lasagna.alarm/0 function that does not take any arguments and returns a message indicating that the lasagna is ready to eat.

    Lasagna.alarm()
    # => "Ding!"
  """

  @doc """
    How long its expected to be in the oven for

    ## Examples

      iex> Lasagna.expected_minutes_in_oven()
      40
  """
  def expected_minutes_in_oven do
    40
  end

  @doc """
    Based off time passed (how long its been in the oven) - work out renaining time

    ## Examples

      iex> Lasagna.remaining_minutes_in_oven(30)
      10
  """
  def remaining_minutes_in_oven(time) do
    expected_minutes_in_oven() - time
  end

  @doc """
    How long it will take to prepare the lasagna. Pass the amount of layers.
    This assumes each layer takes around 2min to prepare

    ## Examples

      iex> Lasagna.preparation_time_in_minutes(2)
      4
  """
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  @doc """
    Time it takes for lasagna to cook based on passing layers and how long its been in the oven already

    ## Examples

      iex> Lasagna.total_time_in_minutes(4, 25)
      33
  """
  def total_time_in_minutes(layers, time) do
    preparation_time_in_minutes(layers) + time
  end

  @doc """
    Lasagna is done!

    ## Examples

      iex> Lasagna.alarm
      "Ding!"
  """
  def alarm do
    "Ding!"
  end
end
