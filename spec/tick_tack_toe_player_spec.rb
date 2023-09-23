
require_relative '../lib/tick_tack_toe_player'

RSpec.describe Player do
  subject(:players) { described_class.new }  
  
 
  describe '#initialize' do
  end

  describe '#get_player_names' do       
    before do
      name1 = 'Bob'
      name2 = 'Alice'
      allow(players).to receive(:puts).twice  
      allow(players).to receive(:get_input).and_return(name1, name2)
    end  

    it 'returns hash' do
      hash = players.get_player_names
      expect(hash).to eq( {'Bob' => 'X', 'Alice' => 'O'} )
    end
  end
end

