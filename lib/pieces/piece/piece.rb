require_relative '../../modules/converter'
class Piece
  attr_accessor :position
  attr_reader :color

  include Converter

  def initialize(color, position)
    @color = color
    @position = position
  end

  def to_s
    @symbol
  end

  def ally?(color)
    @color.eql?(color)
  end
end
