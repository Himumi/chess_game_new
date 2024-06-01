class Chess
  attr_accessor :board, :players

  def initialize(board, players)
    @board = board
    @players = players
  end

  def new_piece(role, color, position)
    piece = {
      'king' => King.new(color, position),
      'queen' => Queen.new(color, position),
      'bishop' => Bishop.new(color, position),
      'knight' => Knight.new(color, position),
      'rook' => Rook.new(color, position),
      'pawn' => Pawn.new(color, position)
    }

    piece[role]
  end
end
