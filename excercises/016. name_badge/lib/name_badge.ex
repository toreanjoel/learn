defmodule NameBadge do
  @moduledoc """
  Documentation for `NameBadge`.

  Instructions
  In this exercise you'll be writing code to print name badges for factory employees. Employees have an ID, name, and department name. Employee badge labels are formatted as follows: "[id] - name - DEPARTMENT".

  1. Print a badge for an employee
  Implement the NameBadge.print/3 function. It should take an id, name, and a department. It should return the badge label, with the department name in uppercase.

  NameBadge.print(67, "Katherine Williams", "Strategic Communication")
  # => "[67] - Katherine Williams - STRATEGIC COMMUNICATION"

  2. Print a badge for a new employee
  Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory. As badges are required, they will receive a temporary badge without the ID prefix.

  Extend the NameBadge.print/3 function. When the id is missing, it should print a badge without it.

  NameBadge.print(nil, "Robert Johnson", "Procurement")
  # => "Robert Johnson - PROCUREMENT"

  3. Print a badge for the owner
  Even the factory's owner has to wear a badge at all times. However, an owner does not have a department. In this case, the label should print "OWNER" instead of the department name.

  Extend the NameBadge.print/3 function. When the department is missing, assume the badge belongs to the company owner.

  NameBadge.print(204, "Rachel Miller", nil)
  # => "[204] - Rachel Miller - OWNER"
  Note that it is possible for the owner to also be a new employee.

  NameBadge.print(nil, "Rachel Miller", nil)
  # => "Rachel Miller - OWNER"
  """

  @doc """
    Print id name and title, with fallbacks to no id and owner for no title

    ## Example
      iex> NameBadge.print(1, "Fullname", "title")
      "[1] - Fullname - TITLE"

      iex> NameBadge.print(nil, "Fullname", "title")
      "Fullname - TITLE"

      iex> NameBadge.print(1, "Fullname", nil)
      "[1] - Fullname - OWNER"

      iex> NameBadge.print(nil, "Fullname", nil)
      "Fullname - OWNER"
  """
  @owner "owner"
  def print(id, name, label) do
    label = String.upcase(if is_nil(label), do: @owner, else: label)
    if is_nil(id) do
      name <> " - " <> label
    else
      "[" <> to_string(id) <> "] - " <> name <> " - " <> label
    end
  end
end
