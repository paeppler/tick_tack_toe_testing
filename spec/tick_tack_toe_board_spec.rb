require_relative '../lib/tick_tack_toe_board'

describe Board do
  subject(:board) { described_class.new(players) }
  let(:players) { instance_double(Player) }

  before do
    allow(players).to receive(:get_player_names)
  end  

  describe '#set_up_game' do
    it 'sends message to player' do
      expect(players).to receive(:get_player_names).once
      board.set_up_game
    end
  end
end
