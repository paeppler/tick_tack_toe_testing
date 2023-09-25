require_relative '../lib/tick_tack_toe_board'

describe Board do
  subject(:board) { described_class.new(players) }
  let(:players) { instance_double(Player) }
  
  before do
    allow(players).to receive(:get_player_names)
    allow(players).to receive(:player1_name)
    allow(players).to receive(:player2_name)
    allow(board).to receive(:puts)
    allow(board).to receive(:print_board)
  end  
  
  describe '#set_up_game' do
    it 'sends message to player' do
      expect(players).to receive(:get_player_names).once
      board.set_up_game 
    end
  end

  describe '#create_current_player' do
    it 'sets current player to player1' do  
      expect(board.instance_variable_get(:@current_player)).to eq(players.player1_name)
    end

    it 'sets current player to player2' do
      board.create_current_player
      expect(board.instance_variable_get(:@current_player)).to eq(players.player2_name)
    end
  end

  describe '#play_round' do
    before do 
      allow(board).to receive(:input_prompt)
      allow(board).to receive(:verify_input).and_return(true)
      allow(board).to receive(:set_input)
      allow(board).to receive(:gets).and_return('1')
    end

    it 'sends message to board' do
      expect(board).to receive(:input_prompt).once
      board.play_round
    end
  end  

  
  describe '#game_over?' do
    context 'board is new' do
      it 'returns false' do
        expect(board.game_over?).to be false
      end
    end
    
    context 'winning combination is achieved' do  
      before do
      end   
      
      it 'returns true when X wins' do
        board.instance_variable_set(:@board, ['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
        expect(board.game_over?).to be true      
      end

      it 'returns true when O wins' do  
        board.instance_variable_set(:@board, [1, 2, 3, 'O', 'O', 'O', 7, 8, 9])
        expect(board.game_over?).to be true      
      end
    end

    context 'game is a tie' do 
      it 'returns true' do
        board.instance_variable_set(:@board, ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', 'O'])
        expect(board.game_over?).to be true      
      end
    end    
  end

  describe '#switch_player' do
    it 'switches current player to player2' do
      board.switch_player
      expect(board.instance_variable_get(:@current_player)).to eq(players.player2_name)
    end

    it 'switches current player back to player1' do
      board.switch_player
      board.switch_player
      expect(board.instance_variable_get(:@current_player)).to eq(players.player1_name)
    end
  end
end

