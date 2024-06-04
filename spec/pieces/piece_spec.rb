require_relative '../../lib/pieces/piece/piece'

describe Piece do
  subject(:piece) { described_class.new('white', 'a8') }

  describe '#ally?' do
    context "when target is ally" do
      it 'returns true' do
        expect(piece.ally?('white')).to be true
      end
    end

    context "when target is not ally" do
      it 'returns false' do
        expect(piece.ally?('black')).to be false
      end
    end
  end
end
