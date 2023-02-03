defmodule LanguageList do
  @moduledoc """
  Documentation for `LanguageList`.

  Instructions
  In this exercise you need to implement some functions to manipulate a list of programming languages.

  1. Define a function to return an empty language list
  Define the new/0 function that takes no arguments and returns an empty list.

  LanguageList.new()
  # => []
  2. Define a function to add a language to the list
  Define the add/2 function that takes 2 arguments (a language list and a string literal of a language). It should return the resulting list with the new language prepended to the given list.

  language_list = LanguageList.new()
  # => []
  language_list = LanguageList.add(language_list, "Clojure")
  # => ["Clojure"]
  language_list = LanguageList.add(language_list, "Haskell")
  # => ["Haskell", "Clojure"]
  3. Define a function to remove a language from the list
  Define the remove/1 function that takes 1 argument (a language list). It should return the list without the first item. Assume the list will always have at least one item.

  language_list = LanguageList.new()
  # => []
  language_list = LanguageList.add(language_list, "Clojure")
  # => ["Clojure"]
  language_list = LanguageList.add(language_list, "Haskell")
  # => ["Haskell", "Clojure"]
  language_list = LanguageList.remove(language_list)
  # => ["Clojure"]
  4. Define a function to return the first item in the list
  Define the first/1 function that takes 1 argument (a language list). It should return the first language in the list. Assume the list will always have at least one item.

  language_list = LanguageList.new()
  # => []
  language_list = LanguageList.add(language_list, "Elm")
  # => ["Elm"]
  language_list = LanguageList.add(language_list, "Prolog")
  # => ["Prolog", "Elm"]
  LanguageList.first(language_list)
  # => "Prolog"
  5. Define a function to return how many languages are in the list
  Define the count/1 function that takes 1 argument (a language list). It should return the number of languages in the list.

  language_list = LanguageList.new()
  # => []
  language_list = LanguageList.add(language_list, "Elm")
  # => ["Elm"]
  language_list = LanguageList.add(language_list, "Prolog")
  # => ["Prolog", "Elm"]
  LanguageList.count(language_list)
  # => 2
  6. Define a function to determine if the list includes a functional language
  Define the functional_list?/1 function which takes 1 argument (a language list). It should return a boolean value. It should return true if "Elixir" is one of the languages in the list.

  language_list = LanguageList.new()
  # => []
  language_list = LanguageList.add(language_list, "Elixir")
  # => ["Elixir"]
  LanguageList.functional_list?(language_list)
  # => true
  """

  @doc """
    Create and return an empty list

    ## Example
      iex> LanguageList.new()
      []
  """
  def new() do
    []
  end

  @doc """
    Prepend item to a list - fast appending to list

    ## Example
      iex> LanguageList.add([1, 2, 4, 5], 6)
      [6, 1, 2, 4, 5]
  """
  def add(list, item) do
    [item] ++ list
  end

  @doc """
    Remove the first item in a list

    ## Example
      iex> LanguageList.remove(["test", "items", "in", "a", "list"])
      ["items", "in", "a", "list"]
  """
  def remove([_head | tail]) do
    tail
  end

  @doc """
    Return the first item in a list

    ## Example
      iex> LanguageList.first([2, 5, 3, 6])
      2
  """
  def first([head | _tail]) do
    head
  end

  @doc """
    Count the length of a list

    ## Example
      iex> LanguageList.count(["items", "in", "a", "list"])
      4
  """
  def count(list) do
    length(list)
  end

  @doc """
    Check if "Elixir" is part of the list - casing matters

    ## Example
      iex> LanguageList.functional_list?(["items", "in", "a", "list"])
      false
  """
  def functional_list?(list) do
    Enum.member?(list, "Elixir")
  end
end
