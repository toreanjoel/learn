defmodule PingPong do
  @turn_finish 11
  def ready do
    receive do
      {_sender, _action, @turn_finish} ->
        IO.puts("DONE")
        ready()
      {sender, action, turn} -> hit_to(sender, switch(action), turn + 1)
        ready()
    after
      1_000 -> IO.puts("timing out: #{inspect player_id()}")
    end

  end

  def hit_to(opponent_id, action, turn) do
    IO.puts("Sent to: #{inspect opponent_id}, Action: #{inspect action}, Turn: #{turn}")
    send(opponent_id, {player_id(), action, turn})
  end

  defp player_id, do: self()
  defp switch(action) do
    case action do
      :ping -> :pong
      _ -> :ping
    end
  end
end

player_2 = PingPong |> Task.start(:ready, []) |> Kernel.elem(1)

PingPong.hit_to(player_2, :ping, 1)
PingPong.ready
