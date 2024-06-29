require_relative '../../lib/pieces/king/king'

class Board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def add(input, source)
    row, column = source[0], source[1]
    @board[row][column] = input
  end

  def on(target)
    row, column = target[0], target[1]
    @board[row][column]
  end

  def is_empty(target)
    row, column = target[0], target[1]
    @board[row][column].nil?
  end
end


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

  describe '#update_moves' do
    subject(:board) { Board.new }
    context 'when king surrounded no enemy' do
      before do
        board.add(king, king.convert_to_indexes(king.position))
      end

      it 'has 8 valid moves' do
        king.update_moves(board)
        count_moves = king.valid_moves.length

        expect(count_moves).to eq(8)
      end
    end
  end
end
