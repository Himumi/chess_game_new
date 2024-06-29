require_relative '../piece/piece'
require_relative '../../modules/uniq_update_moves'

class Knight < Piece
  attr_reader :role, :symbol, :notation, :paths, :each_path

  include UniqUpdateMoves

  def initialize(color, position)
    @role = 'knight'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265E" : "\u2658")
    @notation = 'N'
    @paths = 8
    @each_path = 1
  end

  def direction(position, way)
    a = position[0]
    b = position[1]
    paths = [
      [a-1, b-2], [a-2, b-1], [a-2, b+1], [a-1, b+2],
      [a+1, b+2], [a+2, b+1], [a+2, b-1], [a+1, b-2]
    ]

    return nil if paths[way].any? { |i| !i.between?(0, 7) }
    paths[way]
  end
end
