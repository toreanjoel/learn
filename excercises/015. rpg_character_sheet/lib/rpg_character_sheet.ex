defmodule RpgCharacterSheet do
  @moduledoc """
  Documentation for `RpgCharacterSheet`.

  Instructions
  You and your friends love to play pen-and-paper role-playing games, but you noticed that it's difficult to get new people to join your group. They often struggle with character creation. They don't know where to start. To help new players out, you decided to write a small program that will guide them through the process.

  1. Welcome the new player
  Implement the RPG.CharacterSheet.welcome/0 function. It should print a welcome message, and return :ok.

  RPG.CharacterSheet.welcome()
  # > Welcome! Let's fill out your character sheet together.
  # => :ok

  2. Ask for the character's name
  Implement the RPG.CharacterSheet.ask_name/0 function. It should print a question, wait for an answer, and return the answer without leading and trailing whitespace.

  RPG.CharacterSheet.ask_name()
  # > What is your character's name?
  # < Mathilde
  # => "Mathilde"

  3. Ask for the character's class
  Implement the RPG.CharacterSheet.ask_class/0 function. It should print a question, wait for an answer, and return the answer without leading and trailing whitespace.

  RPG.CharacterSheet.ask_class()
  # > What is your character's class?
  # < healer
  # => "healer"

  4. Ask for the character's level
  Implement the RPG.CharacterSheet.ask_level/0 function. It should print a question, wait for an answer, and return the answer as an integer.

  RPG.CharacterSheet.ask_level()
  # > What is your character's level?
  # < 2
  # => 2
  5. Combine previous steps into one
  Implement the RPG.CharacterSheet.run/0 function. It should welcome the new player, ask for the character's name, class, and level, and return the character sheet as a map. It should also print the map with the label "Your character".

  RPG.CharacterSheet.run()
  # > Welcome! Let's fill out your character sheet together.
  # > What is your character's name?
  # < Mathilde
  # > What is your character's class?
  # < healer
  # > What is your character's level?
  # < 2
  # > Your character: %{class: "healer", level: 2, name: "Mathilde"}
  # => %{class: "healer", level: 2, name: "Mathilde"}
  """

  @doc """
    Welcome message to the user with okay atom at the end

    ## Example
      iex> RpgCharacterSheet.welcome
      "Welcome! Let's fill out your character sheet together."
      :ok
  """
  def welcome do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  @doc """
    Ask for the character name
  """
  def ask_name do
    ask("What is your character's name?")
  end

  @doc """
    Ask for the character class
  """
  def ask_class do
    ask("What is your character's class?")
  end

  @doc """
    Ask for the character level
  """
  @base 10
  def ask_level do
    ask("What is your character's level?")
      |> String.to_integer(@base)
  end

  @doc """
    Run a function that welcomes and asks name, level, class and outputs map
  """
  def run do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    sheet = %{class: class, level: level, name: name}
    IO.inspect(sheet, label: "Your character")
  end

  # Heler that does the IO.get with requested string
  defp ask(string), do: IO.gets(string <> "\n")  |> String.trim
end
