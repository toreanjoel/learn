defmodule LogLevelTest do
  use ExUnit.Case
  doctest LogLevel

  test "Check Log label" do
    assert LogLevel.to_label(0, false) === :trace
  end

  test "Send alert to team" do
    assert LogLevel.alert_recipient(-1, true) === :dev1
  end
end
