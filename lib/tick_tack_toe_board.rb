
require_relative '../lib/tick_tack_toe_player'

class Board  
  WINNING_COMBINATIONS = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # Rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # Columns
    [1, 5, 9], [3, 5, 7]              # Diagonals
  ].freeze

  def initialize(players = Player.new)
    @players = players
    @current_player
    @board = (1..9).to_a
  end

  def play_game
    set_up_game
    create_current_player
    loop do 
      play_round
      break if if_game_over 
      switch_player
    end
  end  
  
  def set_up_game
    @players.get_player_names
    puts "\n#{@players.player1_name} plays with 'X', #{@players.player2_name} plays with 'O'"
    print_board
  end 

  def print_board
    puts <<-HEREDOC


            #{@board[0]} | #{@board[1]} | #{@board[2]}
           ---+---+---
            #{@board[3]} | #{@board[4]} | #{@board[5]}
           ---+---+---
            #{@board[6]} | #{@board[7]} | #{@board[8]}


    HEREDOC
  end

  def create_current_player
    @current_player = @players.player1_name
  end

  def play_round
    input_prompt
    loop do
      input = gets.chomp.to_i
      if verify_input(input) 
        set_input(input)
        break
      else 
        puts "\e[31mIncorrect Input. Try again.\e[0m"
      end
    end
    print_board
  end

  def input_prompt
    puts "#{@current_player}'s turn. Enter a number from 1-9."
  end

  def verify_input(input)
    input.to_s.match?(/^[1-9]$/) && input == @board[input-1]
  end

  def set_input(input)
    if @current_player == @players.player1_name
      @board[input-1] = 'X'
    else
      @board[input-1] = 'O'  
    end
  end

  def if_game_over
    if game_over? && WINNING_COMBINATIONS.any? do |combo|
                      combo.all? { |position| @board[position - 1] == @players.player_names[@current_player] }
                      end
      puts "\e[32mGame Over! #{@current_player} wins!\e[0m"
      return true
    elsif game_over?
      puts 'Game Over! Its a tie'
      return true
    else 
      return false
    end
  end
  
  def game_over?
    WINNING_COMBINATIONS.any? do |combo|
      combo.all? { |position| @board[position - 1] == @players.player_names[@current_player] }
    end || @board.all? { |square| square == 'X' || square == 'O' }
  end

  def switch_player
    if @current_player == @players.player1_name
      @current_player = @players.player2_name
    else 
      @current_player = @players.player1_name
    end
  end  
end

