require_relative '../piece/piece'

class Rook < Piece
  attr_reader :role, :symbol, :notation, :paths

  def initialize(color, position)
    @role = 'rook'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265C" : "\u2656")
    @notation = 'R'
    @paths = 4
  end

  def direction(position, way)
    a = position[0]
    b = position[1]
    paths = [
      [a, b-1], [a-1, b], [a, b+1], [a+1, b]
    ]

    return nil if paths[way].any? { |i| !i.between?(0, 7) }
    paths[way]
  end
end
