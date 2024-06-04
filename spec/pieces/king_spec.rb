require_relative '../../lib/pieces/king/king'

describe King do
  subject(:king) { described_class.new('white', 'd4') }

  describe '#direction' do
    context 'when based position is D4 or [4, 3]' do
      it 'returns [4, 2] for left side' do
        expect(king.direction([4, 3], 0)).to eq([4, 2])
      end

      it 'returns [3, 3] for top side' do
        expect(king.direction([4, 3], 2)).to eq([3, 3])
      end

      it 'returns [4, 4] for right side' do
        expect(king.direction([4, 3], 4)).to eq([4, 4])
      end

      it 'returns [5, 3] for bottom side' do
        expect(king.direction([4, 3], 6)).to eq([5, 3])
      end

      it 'retunrs [3, 2] for left top side' do
        expect(king.direction([4, 3], 1)).to eq([3, 2])
      end

      it 'returns [3, 4] for right top side' do
        expect(king.direction([4, 3], 3)).to eq([3, 4])

      end

      it 'returns [5, 4] for right bottom side' do
        expect(king.direction([4, 3], 5)).to eq([5, 4])
      end

      it 'returns [5, 2] for left bottom side' do
        expect(king.direction([4, 3], 7)).to eq([5, 2])
      end

      it 'returns nil if outside of board' do
        expect(king.direction([0, 0], 0)).to be_nil
      end

      it 'returns nil if invalid input' do
        expect(king.direction([9, 9], 1)).to be_nil
      end
    end
  end
end
