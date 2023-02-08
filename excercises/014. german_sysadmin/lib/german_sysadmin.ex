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

  @substitute %{
    228 => 'ae',
    228 => 'ae',
    246 => 'oe',
    252 => 'ue',
    223 => 'ss'
  }

  @lower_case_char 97..122
  @underscore_char 95..95

  def sanitize(char_list) do
    value = Enum.filter(
      substitute_wrapper(to_charlist(char_list)),
      fn i ->
        (check_range(i) || check_range(i, @underscore_char)) &&
        i end)

  end

  defp check_range(char, range \\ @lower_case_char) do
    char in range
  end

  def substitute_wrapper(chars) do
    Enum.map(chars, fn item -> {
      case @substitute[item] do
        nil -> [item]
        _ -> @substitute[item]
      end
    }
    end)
      |> Enum.map(fn c -> elem(c, 0) end)
      |> Enum.concat()
  end
end
