defmodule LogLevel do
  @moduledoc """
  Documentation for `LogLevel`.

  Instructions
  You are running a system that consists of a few applications producing many logs. You want to write a small program that will aggregate those logs and give them labels according to their severity level. All applications in your system use the same log codes, but some of the legacy applications don't support all the codes.

  Log code	Log label	Supported in legacy apps?
  0	trace	no
  1	debug	yes
  2	info	yes
  3	warning	yes
  4	error	yes
  5	fatal	no
  ?	unknown	-

  1. Return the logging code label
  Implement the LogLevel.to_label/2 function.
  It should take an integer code and a boolean flag telling you if the log comes from a legacy app,
  and return the label of a log line as an atom.
  Unknown log codes and codes unsupported in a legacy app should return an unknown label.

  LogLevel.to_label(0, false)
  # => :trace

  LogLevel.to_label(0, true)
  # => :unknown

  2. Send an alert
  Somebody has to be notified when unexpected things happen.

  Implement the LogLevel.alert_recipient/2 function to determine to whom the alert needs to be sent.
  The function should take an integer code and a boolean flag telling you if the log comes from a legacy app,
  and return the name of the recipient as an atom.

  If the log label is error or fatal, send the alert to the ops team.

  If you receive a log with an unknown label from a legacy system, send the alert to the dev1 team,

  other unknown labels should be sent to the dev2 team. All other log labels can be safely ignored.

  LogLevel.alert_recipient(-1, true)
  # => :dev1

  LogLevel.alert_recipient(0, false)
  # => false
  """

  @log_code %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  @legacy_support %{
    0 => false,
    1 => true,
    2 => true,
    3 => true,
    4 => true,
    5 => false
  }

  @doc """
    If legacy, check if the code is supported, show, else show unknown for legacy

    ## Example
      iex> LogLevel.to_label(0, true)
      :unknown
  """
  def to_label(code, legacy) when legacy do
    case @legacy_support[code] do
      true -> @log_code[code]
      _ -> :unknown
    end
  end

  def to_label(code, _legacy) do
    case @log_code[code] do
      nil -> :unknown
      _ -> @log_code[code]
    end
  end

  @doc """
    Alert relevant parties based on error level and if its a legacy app or not

    ## Example
      iex> LogLevel.alert_recipient(-1, true)
      :dev1
  """
  def alert_recipient(code, legacy) do
    alert = to_label(code, legacy)
    cond do
      alert === :error || alert === :fatal -> :ops
      alert === :unknown ->
        cond do
          legacy -> :dev1
          !legacy -> :dev2
        end
      true -> false
    end
  end

end
