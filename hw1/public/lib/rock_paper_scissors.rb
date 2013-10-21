class RockPaperScissors
    
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  
  def self.winner(player1, player2)
    
    raise NoSuchStrategyError, "Strategy must be one of R,P,S" unless player1[1] =~ /[RSP]/i and player2[1] =~ /[RSP]/i
    
    # refactor
    return player1 if player1[1] == "R" && player2[1] == "S"
    return player1 if player1[1] == "S" && player2[1] == "P"
    return player1 if player1[1] == "P" && player2[1] == "R"
    return player2 if player1[1] == "S" && player2[1] == "R"
    return player2 if player1[1] == "P" && player2[1] == "S"
    return player2 if player1[1] == "R" && player2[1] == "P"
    player1
  end

  def self.tournament_winner(tournament)
    return winner(tournament[0],tournament[1]) if tournament[0][0].is_a? String
    
    return tournament_winner([tournament_winner(tournament[0]),tournament_winner(tournament[1])])
  end

end
