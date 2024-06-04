require_relative '../piece/piece'

class Bishop < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'bishop'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265D" : "\u2657")
    @notation = 'B'
  end
end
