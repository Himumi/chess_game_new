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
    result = []
    seen = {}
    queue = add_all_directions(@key)

    loop do
      return @valid_moves = result if queue.empty?

      first = queue.shift
      key, path = first[0], first[1]

      if seen[path] || key.nil? || ( !board.on(key).nil? && board.on(key).ally?(@color))
        seen[path] = key if !seen[path]
        next
      end

      seen[path] = key if !board.on(key).nil? && !board.on(key).ally?(@color)

      queue <<  add_direction(key, path) unless direction(key, path).nil?
      result << convert_to_key(key)
    end
  end

  def add_all_directions(key)
    result = []
    converted = convert_to_indexes(@position)

    paths.times do |path|
      next_direction = direction(converted, path)
      result << [next_direction, path] if !next_direction.nil?
    end

    result
  end

  def add_direction(key, path)
    [direction(key, path), path]
  end
end
