require_relative '../piece/piece'

class Rook < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'rook'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265C" : "\u2656")
    @notation = 'R'
  end
end
