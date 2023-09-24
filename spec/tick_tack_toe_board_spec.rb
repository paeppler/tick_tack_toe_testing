require_relative '../lib/tick_tack_toe_board'

describe Board do
  subject(:board) { described_class.new(players) }
  let(:players) { instance_double(Player) }
  
  before do
    allow(players).to receive(:get_player_names)
  end  
  
  describe '#set_up_game' do
    xit 'sends message to player' do
      expect(players).to receive(:get_player_names).once
      board.set_up_game
    end

  describe '#verify_input' do
    it 'should print a 3x3 board with numbers 1-9'

  end

  describe '#game_over?' do
    context 'winning combination is achieved'
    
    xit 'returns true' do
      board.instance_variable_set(:@board, ['X', 'X', 'X', 4, 5, 6, 7, 8, 9])
      board.instance_variable_set(:@current_player, 'bob')
      @players.instance_variable_set(:@player_names['bob'], 'X')
          expect(board.game_over?).to eq(true)
          board.game_over?
        end
    end    
  end
end
