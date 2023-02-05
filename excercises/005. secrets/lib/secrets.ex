defmodule Secrets do
  @moduledoc """
  Documentation for `Secrets`.

  Instructions
  In this exercise, you've been tasked with writing the software for an encryption device that works by performing transformations on data. You need a way to flexibly create complicated functions by combining simpler functions together.

  For each task, return an anonymous function that can be invoked from the calling scope.

  All functions should expect integer arguments. Integers are also suitable for performing bitwise operations in Elixir.

  1. Create an adder
  Implement Secrets.secret_add/1. It should return a function which takes one argument and adds to it the argument passed in to secret_add.

  adder = Secrets.secret_add(2)
  adder.(2)
  # => 4
  2. Create a subtractor
  Implement Secrets.secret_subtract/1. It should return a function which takes one argument and subtracts the secret passed in to secret_subtract from that argument.

  subtractor = Secrets.secret_subtract(2)
  subtractor.(3)
  # => 1
  3. Create a multiplier
  Implement Secrets.secret_multiply/1. It should return a function which takes one argument and multiplies it by the secret passed in to secret_multiply.

  multiplier = Secrets.secret_multiply(7)
  multiplier.(3)
  # => 21
  4. Create a divider
  Implement Secrets.secret_divide/1. It should return a function which takes one argument and divides it by the secret passed in to secret_divide.

  divider = Secrets.secret_divide(3)
  divider.(32)
  # => 10
  Make use of integer division so the output is compatible with the other functions' expected input.

  5. Create an "and"-er
  Implement Secrets.secret_and/1. It should return a function which takes one argument and performs a bitwise and operation on it and the secret passed in to secret_and.

  ander = Secrets.secret_and(1)
  ander.(2)
  # => 0
  6. Create an "xor"-er
  Implement Secrets.secret_xor/1. It should return a function which takes one argument and performs a bitwise xor operation on it and the secret passed in to secret_xor.

  xorer = Secrets.secret_xor(1)
  xorer.(3)
  # => 2
  7. Create a function combiner
  Implement Secrets.secret_combine/2. It should return a function which takes one argument and applies to it the two functions passed in to secret_combine in order.

  multiply = Secrets.secret_multiply(7)
  divide = Secrets.secret_divide(3)
  combined = Secrets.secret_combine(multiply, divide)

  combined.(6)
  # => 14
  """

  @doc """
   Take a value and return a function with the value that will be added to the func

   ## Example
    iex> func = Secrets.secret_add(5)
    iex> func.(3)
    8
  """
  def secret_add(value) do
    fn item -> item + value end
  end

  @doc """
   Take a value and return a function with the value that will be subtracted to the func

   ## Example
    iex> func = Secrets.secret_subtract(5)
    iex> func.(3)
    -2
  """
  def secret_subtract(value) do
    fn item -> item - value end
  end

  @doc """
   Take a value and return a function with the value that will be multiplied to the func

   ## Example
    iex> func = Secrets.secret_multiply(5)
    iex> func.(3)
    15
  """
  def secret_multiply(value) do
    fn item -> item * value end
  end

  @doc """
   Take a value and return a function with the value that will be multiplied to the func

   ## Example
    iex> func = Secrets.secret_divide(5)
    iex> func.(3)
    0
  """
  def secret_divide(value) do
    fn item -> div(item, value) end
  end

  @doc """
   Take a value and return a function with the value that will be checked (AND) bitwise to the func

   Compare each bit against both values and check if they are both true (1) keep it true or make it false (0)
   ## Example
    iex> func = Secrets.secret_and(15)
    iex> func.(8)
    8
  """
  def secret_and(value) do
    fn item -> Bitwise.band(item, value) end
  end

  @doc """
   Take a value and return a function with the value that will be checked (XOR) bitwise to the func

   Compare each bit against both values and check if corrosponding bit is not the same and one of them are atleast 1 else 0
   ## Example
    iex> func = Secrets.secret_xor(15)
    iex> func.(8)
    7
  """
  def secret_xor(value) do
    fn item -> Bitwise.bxor(item, value) end
  end

  @doc """
   Pass a 2 functions, return a function that will allow passing a value that will be passed to first function.
   Take the result of that function and pass it to the other function as the result

   ## Example
    iex> func1 = fn value -> value + 1 end
    iex> func2 = fn value -> value - 1 end
    iex> both = Secrets.secret_combine(func1, func2)
    iex> both.(10)
  """
  def secret_combine(func1, func2) do
    fn input ->
      func = func1.(input)
      func2.(func)
    end
  end
end
