require_relative '../../lib/pieces/rook/rook'

describe Rook do
  subject(:rook) { described_class.new('white', 'd4') }

  describe '#direction' do
    context 'when based position is D4 or [4, 3]' do
      it 'returns [4, 2] for left side' do
        expect(rook.direction([4, 3], 0)).to eq([4, 2])
      end

      it 'returns [3, 3] for top side' do
        expect(rook.direction([4, 3], 1)).to eq([3, 3])
      end

      it 'returns [4, 4] for right side' do
        expect(rook.direction([4, 3], 2)).to eq([4, 4])
      end

      it 'returns [5, 3] for bottom side' do
        expect(rook.direction([4, 3], 3)).to eq([5, 3])
      end

      it 'returns nil if outside of board' do
        expect(rook.direction([0, 0], 0)).to be_nil
      end

      it 'returns nil if invalid input' do
        expect(rook.direction([9, 9], 1)).to be_nil
      end
    end
  end
end
