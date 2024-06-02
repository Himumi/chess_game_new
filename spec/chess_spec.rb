require './lib/chess/chess.rb'

describe Chess do
  let(:board) { double('Board', board: Array.new(8)) }
  let(:first_player) { double('Player', color: 'white') }
  let(:second_player) { double('Player', color: 'black') }
  subject(:game) { described_class.new(board, [first_player, second_player]) }
  describe '#convert_to_indexes' do
    it 'converts a1 to [0, 0]' do
      converted = game.convert_to_indexes('a8')

      expect(converted).to eq([0, 0])
    end

    it 'returns nil when key is invalid' do
      converted = game.convert_to_indexes('j1')

      expect(converted).to be_nil
    end

    it 'returns nil when key is more than 2' do
      converted = game.convert_to_indexes('a-1')

      expect(converted).to be_nil
    end
  end

  describe '#convert_to_key' do
    it 'converts [0, 0] to a8' do
      converted = game.convert_to_key([0, 0])

      expect(converted).to eq('a8')
    end

    it 'returns nil when indexes is invalid' do
      converted = game.convert_to_key([9,0])

      expect(converted).to be_nil
    end

    it 'returns nil when indexes is more than 2' do
      converted = game.convert_to_key([0, 0, 0])

      expect(converted).to be_nil
    end

    it 'returns nil when indexes is not 2' do
      converted = game.convert_to_key([0])

      expect(converted).to be_nil
    end
  end
end
