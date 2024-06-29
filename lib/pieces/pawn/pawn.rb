require_relative '../piece/piece'

class Pawn < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'pawn'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265F" : "\u2659")
    @notation = ''
    @moved = true
  end

  def valid_direction(position)
    a = position[0]
    b = position[1]

    paths = {
      'white' => [a - 1, b],
      'black' => [a + 1, b]
    }

    return nil if paths[@color].any? { |i| !i.between?(0, 7) }

    paths[@color]
  end

  def capturable_direction(position, path)
    a = position[0]
    b = position[1]

    paths = {
      'white' => [[a - 1, b - 1], [a - 1, b + 1]],
      'black' => [[a + 1, b - 1], [a + 1, b + 1]]
    }

    return nil if paths[@color][path].any? { |i| !i.between?(0, 7) }

    paths[@color][path]
  end

end

pawn = Pawn.new("white", "a1")

p pawn.capturable_direction([6,0], 0)
