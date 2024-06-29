require_relative '../piece/piece'

class Pawn < Piece
  attr_reader :role, :symbol, :notation
  attr_accessor :moved

  def initialize(color, position)
    @role = 'pawn'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265F" : "\u2659")
    @notation = ''
    @moved = false
  end

  def valid_direction(position)
    a = position[0]
    b = position[1]

    paths = {
      'white' => [a - 1, b],
      'black' => [a + 1, b]
    }

    return nil if paths[@color].any? { |i| !i.between?(0, 7) }

    paths[@color]
  end

  def capturable_direction(position, path)
    a = position[0]
    b = position[1]

    paths = {
      'white' => [[a - 1, b - 1], [a - 1, b + 1]],
      'black' => [[a + 1, b - 1], [a + 1, b + 1]]
    }

    return nil if paths[@color][path].any? { |i| !i.between?(0, 7) }

    paths[@color][path]
  end

  def valid_move(board)
    stop = false
    result = []

    max_move = @moved ? 1 : 2 # when false can move 2 step

    current = convert_to_indexes(@position)

    max_move.times do
      key = valid_direction(current)

      next stop = true if stop || key.nil? || !board.on(key).nil?

      current = key
      result << convert_to_key(key)
    end

    result
  end

  def capturable_move(board)
    result = []
    current = convert_to_indexes(@position)

    2.times do |path|
      key = capturable_direction(current, path)

      next if key.nil? || board.on(key).nil? || board.on(key).ally?(@color)

      result << convert_to_key(key)
    end

    result
  end
end
