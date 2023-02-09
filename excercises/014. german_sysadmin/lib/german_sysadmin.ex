defmodule GermanSysadmin do
  @moduledoc """
  Documentation for `GermanSysadmin`.

  Instructions
  You are working as a system administrator for a big company in Munich, Germany.
   One of your responsibilities is managing email accounts.

  You have been hearing complaints from people saying they are unable to write emails to Mr. Müller.
  You quickly realize that most of the company uses an old email client that doesn't recognize müller@firma.de as a
  valid email address because of the non-Latin character.

  Telling people to give up their favorite old email client is a lost battle, so you decide to create sanitized
  aliases for all email accounts.

  1. Sanitize existing usernames by removing everything but lowercase letters
  Implement the sanitize/1 function.
  It should accept a username as a charlist and return the username with all characters
  but lowercase letters removed.

  Username.sanitize('schmidt1985')

  # => 'schmidt'

  2. Allow underscores
  Extend the sanitize/1 function. It should not remove underscores from the username.

  Username.sanitize('mark_fischer$$$')
  # => 'mark_fischer'

  3. Substitute German characters
  There are 4 non-Latin characters in the German alphabet, and all of them have commonly-recognized Latin substitutes.

  German character	Latin substitute
  ä	ae
  ö	oe
  ü	ue
  ß	ss
  Extend the sanitize/1 function. It should substitute German characters according to the table. You can safely assume all usernames are already downcase.

  Username.sanitize('cäcilie_weiß')
  # => 'caecilie_weiss'
  """

  @doc """
   Charlist empty or empty list returns empty charlist - nothing which will be a list
   as there is no items to represent a character as a charlist

   ## Example
    iex> GermanSysadmin.sanitize('')
    []
    iex> GermanSysadmin.sanitize('test')
    'test'
    iex> GermanSysadmin.sanitize('helä wörlds')
    'helaewoerlds'
  """
  def sanitize(''), do: ''
  def sanitize([head | tail]) do
    # conditional against the taken out character
    char = case head do
      # check if character code matches
      # The ? converts the value to its numeric character code
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      # match value and assign it against X
      # check if x Exists in a range - see above
      # range is based off the unicaode numeric values
      # return the value as a 1 indice elem
      # check if an underscore chracter
      # return the value charlist item, will be a 1 elem list being a charlist
      x when (x >= ?a and x <= ?z) or (x === ?_) -> [x]
      #  return nothing or empty charlist
      # will match against other function
      _ -> ''
    end

    # After each character is checked, merge the charlist character with the rest
    # rest = passing the remaining and recustively adding and checking each character in line
    char ++ sanitize(tail)
  end
end


[104,101,108,97,101,119,111,101,114,108,100,115]
