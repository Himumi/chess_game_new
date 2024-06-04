class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(color, position)
    @color = color
    @position = position
  end

  def to_s
    @symbol
  end
end
