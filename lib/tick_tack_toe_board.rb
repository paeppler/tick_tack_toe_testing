
require_relative '../lib/tick_tack_toe_player'

class Board  

  def initialize(players = Player.new)
    @players = players
    # puts @players.keys[0]
    # @current_player = @players[player1_name]
  end

  def set_up_game
    p @players.get_player_names
  end 
  
end

