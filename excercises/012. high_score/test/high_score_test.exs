defmodule HighScoreTest do
  use ExUnit.Case
  doctest HighScore

  @score_board %{
    "1" => 0,
    "2" => 10,
    "3" => 404,
  }

  # using variable mutating to match and assert final object below
  # ideally should be mocked with dummy data

  test "Make new empty object" do
    assert HighScore.new === %{}
  end

  test "Add player to the object with value" do
    assert HighScore.add_player(@score_board, "new", 22) === Map.put(@score_board, "new", 22)
  end

  test "Add player to the object with NO value" do
    assert HighScore.add_player(@score_board, "new") === Map.put(@score_board, "new", 0)
  end

  test "Reset the score of a player" do
    assert HighScore.add_player(@score_board, "1") === Map.put(@score_board, "1", 0)
  end

  test "Update the score of a player adding to it" do
    assert HighScore.update_score(@score_board, "1", 321) === Map.put(@score_board, "1", 321)
    assert HighScore.update_score(@score_board, "3", 44) === Map.put(@score_board, "3", 448)
  end

  test "Get list of keys or players" do
    assert HighScore.get_players(@score_board) === ["1", "2", "3"]
  end
end
