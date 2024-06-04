require_relative '../piece/piece'

class Queen < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'queen'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265B" : "\u2655")
    @notation = 'Q'
  end
end
