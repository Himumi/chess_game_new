require_relative '../piece/piece'

class Bishop < Piece
  attr_reader :role, :symbol, :notation, :paths

  def initialize(color, position)
    @role = 'bishop'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265D" : "\u2657")
    @notation = 'B'
    @paths = 4
  end

  def direction(position, way)
    a = position[0]
    b = position[1]
    paths = [
      [a-1, b-1], [a-1, b+1], [a+1, b+1], [a+1, b-1]
    ]

    return nil if paths[way].any? { |i| !i.between?(0, 7) }
    paths[way]
  end
end
