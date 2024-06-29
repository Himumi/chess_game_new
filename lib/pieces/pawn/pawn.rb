require_relative '../piece/piece'

class Pawn < Piece
  attr_reader :role, :symbol, :notation

  def initialize(color, position)
    @role = 'pawn'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265F" : "\u2659")
    @notation = ''
  end
end
