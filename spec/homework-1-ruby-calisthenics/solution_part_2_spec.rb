require 'spec_helper'

describe "rps_game_winner" do
  context "when the number of players is not equal to 2" do
    it "should raise WrongNumberOfPlayersError" do
      expect {
        rps_game_winner([ ["P1","R"] ])
      }.to raise_error WrongNumberOfPlayersError

      expect {
        rps_game_winner([ ["P1","R"], ["P2","S"], ["P3","P"] ])
      }.to raise_error WrongNumberOfPlayersError
    end
  end

  context "when player's strategy is something other than 'R', 'P' or 'S'" do
    it "should raise NoSuchStrategyError" do
      ["P","R","S","p","r","s"].each do |strategy|
        expect {
          rps_game_winner([ ["P1","A"], ["P2", strategy] ])
        }.to raise_error NoSuchStrategyError

        expect {
          rps_game_winner([ ["P1",strategy], ["P2", "A"] ])
        }.to raise_error NoSuchStrategyError
      end
    end
  end

  context "when both players strategy are valid" do
    let(:player_rock)     { ["PlayerRock", "R"] }
    let(:player_paper)    { ["PlayerPaper", "P"] }
    let(:player_scissors) { ["PlayerScissors", "S"] }

    context "and both players have the same strategy" do
      it "should return the first player as winner" do
        ["P","R","S","p","r","s"].each do |strategy|
          first_player = ["P1",strategy]
	  rps_game_winner([ first_player ,["P2", strategy] ]).should be_equal(first_player)
        end
      end
    end

    context "and a player choose rock" do
      it "should beats scissors" do
        rps_game_winner([ player_rock, player_scissors ]).should be_equal(player_rock)
        rps_game_winner([ player_scissors, player_rock ]).should be_equal(player_rock)
      end
    end

    context "and a player choose paper" do
      it "should beats rock" do
        rps_game_winner([ player_rock, player_paper ]).should be_equal(player_paper)
        rps_game_winner([ player_paper, player_rock ]).should be_equal(player_paper)
      end
    end

    context "and a player choose scissors" do
      it "should beats paper" do
        rps_game_winner([ player_scissors, player_paper ]).should be_equal(player_scissors)
        rps_game_winner([ player_paper, player_scissors ]).should be_equal(player_scissors)
      end
    end
  end
end
