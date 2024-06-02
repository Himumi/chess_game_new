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

  def convert_to_indexes(key)
    letters = {
      'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3,
      'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7
    }

    numbers = {
      '1' => 7, '2' => 6, '3' => 5, '4' => 4,
      '5' => 3, '6' => 2, '7' => 1, '8' => 0
    }

    letter = letters[key[0]]
    number = numbers[key[1]]

    return nil if letter.nil? or number.nil?

    [letter, number]
  end
end