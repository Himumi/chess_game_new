require_relative '../../lib/pieces/bishop/bishop'

describe Bishop do
  subject(:bishop) { described_class.new('white', 'd4') }

  describe '#direction' do
    context 'when based position is D4 or [4, 3]' do
      it 'retunrs [3, 2] for left top side' do
        expect(bishop.direction([4, 3], 0)).to eq([3, 2])
      end

      it 'returns [3, 4] for right top side' do
        expect(bishop.direction([4, 3], 1)).to eq([3, 4])

      end

      it 'returns [5, 4] for right bottom side' do
        expect(bishop.direction([4, 3], 2)).to eq([5, 4])
      end

      it 'returns [5, 2] for left bottom side' do
        expect(bishop.direction([4, 3], 3)).to eq([5, 2])
      end

      it 'returns nil if outside of board' do
        expect(bishop.direction([0, 0], 0)).to be_nil
      end

      it 'returns nil if invalid input' do
        expect(bishop.direction([9, 9], 0)).to be_nil
      end
    end
  end
end
