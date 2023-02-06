defmodule Recurr do
	def countdown(0), do: "Lift off!"
	def countdown(10) do
		IO.puts "we lift off in 10"
		countdown(10 - 1)
	end
	def countdown(n) do
		Process.sleep(1000)
		IO.puts n
		countdown(n - 1)
	end
end
