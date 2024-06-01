require './lib/board/board.rb'

describe Board do
  describe '#initialize' do
    subject(:game_board) { described_class.new }

    it 'has 8 rows' do
      rows = game_board.board.length
      expect(rows).to eq(8)
    end

    it 'has 8 columns' do
      columns = game_board.board[0].length
      expect(columns).to eq(8)
    end

    it 'has 64 squares in total' do
      total = game_board.board.sum { |row| row.count }
      expect(total).to eq(64)
    end
  end

  describe '#add' do
    subject(:board_add) { described_class.new }

    it 'adds piece onto board' do
      board_add.add("A", 0, 0)
      h1 = board_add.board[0][0]
      expect(h1).to eq("A")
    end
  end
end
