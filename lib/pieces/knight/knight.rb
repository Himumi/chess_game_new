require_relative '../piece/piece'

class Knight < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'knight'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265E" : "\u2658")
    @notation = 'N'
  end
end
