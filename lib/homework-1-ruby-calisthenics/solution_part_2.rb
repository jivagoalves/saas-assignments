class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

RULES = {"R" => "S", "P" => "R", "S" => "P"}

def check_errors!(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless ["P","R","S"].include?(game.first.last.upcase)
  raise NoSuchStrategyError unless ["P","R","S"].include?(game.last.last.upcase)
end

def rps_game_winner(game)
  check_errors!(game)

  first_player = game.first
  first_player_strategy = first_player.last
  second_player = game.last
  second_player_strategy = second_player.last

  return first_player unless first_player_strategy != second_player_strategy
  return first_player if RULES[first_player_strategy] == second_player_strategy
  second_player
end

def rps_tournament_winner(tournament)
  return tournament if tournament.first.is_a? String
  return rps_game_winner([ rps_tournament_winner(tournament.first), rps_tournament_winner(tournament.last) ])
end
