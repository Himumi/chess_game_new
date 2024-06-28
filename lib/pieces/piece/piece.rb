require_relative '../../modules/converter'
class Piece
  attr_accessor :position
  attr_reader :color, :valid_moves

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

  def enemy?(color)
    !ally?(color)
  end

  def update_moves(board)
    queue = []
    seen = {}
    result = []

    converted = convert_to_indexes(@position)

    paths.times do |path|
      next_direction = direction(converted, path)
      queue << [next_direction, path] if !next_direction.nil?
    end

    loop do
      return @valid_moves = result if queue.empty?

      first = queue.shift
      key, way = first[0], first[1]

      if seen[way] || key.nil? || ( !board.on(key).nil? && board.on(key).ally?(@color))
        seen[way] = key if !seen[way]
        next
      end

      seen[way] = key if !board.on(key).nil? && !board.on(key).ally?(@color)

      queue << [direction(key, way), way] unless direction(key, way).nil?

      result << convert_to_key(key)
    end
  end
end
