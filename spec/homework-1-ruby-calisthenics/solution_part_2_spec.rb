require 'spec_helper'

describe "rps_game_winner" do
  context "when the number of players is not equal to 2" do
    it "should raise WrongNumberOfPlayersError" do
      one_player = [[ "Armando", "P" ]]
      expect {
        rps_game_winner(one_player)
      }.to raise_error WrongNumberOfPlayersError

      three_players = one_player
      three_players << ["Ji", "S"]
      three_players << ["Mama", "R"]
      expect {
        rps_game_winner(three_players)
      }.to raise_error WrongNumberOfPlayersError
    end
  end
end
