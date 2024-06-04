require_relative '../piece/piece'

class King < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'king'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265A" : "\u2654")
    @notation = 'K'
  end

  def direction(position, way)
    a = position[0]
    b = position[1]
    paths = [
      [a, b-1], [a-1, b-1], [a-1, b], [a-1, b+1],
      [a, b+1], [a+1, b+1], [a+1, b], [a+1, b-1]
    ]

    return nil if paths[way].any? { |i| !i.between?(0, 7) }
    paths[way]
  end
end
