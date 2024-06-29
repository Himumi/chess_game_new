require './lib/board/board.rb'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    it 'has 8 rows' do
      rows = board.board.length
      expect(rows).to eq(8)
    end

    it 'has 8 columns' do
      columns = board.board[0].length
      expect(columns).to eq(8)
    end

    it 'has 64 squares in total' do
      total = board.board.sum { |row| row.count }
      expect(total).to eq(64)
    end
  end

  describe '#add' do
    it 'adds piece onto board' do
      board.add("A", [0, 0])
      a8 = board.board[0][0]
      expect(a8).to eq("A")
    end
  end

  describe '#remove' do
    before do
      board.add("A", [0, 0])
    end

    it 'removes piece from board' do
      board.remove([0, 0])
      a8 = board.board[0][0]

      expect(a8).to be_nil
    end
  end

  describe '#move' do
    context 'moves piece from a8 to h1' do

      before do
        a8, h1 = [0, 0], [7, 7]
        board.add("A", [0, 0])
        board.move(a8, h1)
      end

      it 'is nil at a8' do
        a8 = board.board[0][0]
        expect(a8).to be_nil
      end

      it 'is not nil at h1' do
        h1 = board.board[7][7]
        expect(h1).not_to be_nil
      end
    end
  end

  describe '#on' do
    context "when value on the board" do
      before do
        board.add('A', [7,7])
        board.add('B', [5,5])
      end

      it 'returns true when value on the board' do
        value = board.on([7,7])

        expect(value).to eq('A')
      end

      it 'returns true when value on the board' do
        value = board.on([5, 5])

        expect(value).to eq('B')
      end
    end

    context "when value not on the board" do

      before do
        board.add('A', [7,7])
        board.add('B', [5,5])
      end

      it 'returns false when value not on the board' do
        value = board.on([0, 0])

        expect(value).to be_nil
      end
    end
  end

  describe '#is_empty' do

    context 'when target is empty' do
      it 'returns true' do
        empty = board.is_empty([0,0])

        expect(empty).to be true
      end
    end

    context "when target is not empty" do

      before do
        
        board.add("A", [0, 0])
      end

      it 'returns false' do
        empty = board.is_empty([0, 0])

        expect(empty).to be false
      end
    end

  end
end
