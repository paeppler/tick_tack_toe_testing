class Player
  attr_accessor :player1_name, :player2_name

  def initialize()
    @player1_name
    @player2_name
  end

  def get_player_names
    puts 'Enter name of player 1:'
    @player1_name = get_input
    puts 'Enter name of player 2:'
    @player2_name = get_input
    { @player1_name => 'X', @player2_name => 'O' }
  end

  def get_input
    gets.chomp
  end
end