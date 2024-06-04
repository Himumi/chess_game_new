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
end
