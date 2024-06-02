class Pieces
  attr_accessor :position
  attr_reader :role, :color, :symbol, :notation
  def initialize(color, position)
    @color = color
    @position = position
  end

  def to_s
    @symbol
  end
end

class King < Pieces
  def initialize(color, position)
    @role = 'king'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265A" : "\u2654")
    @notation = 'K'
  end
end

class Queen < Pieces
  def initialize(color, position)
    @role = 'queen'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265B" : "\u2655")
    @notation = 'Q'
  end
end

class Bishop < Pieces
  def initialize(color, position)
    @role = 'bishop'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265D" : "\u2657")
    @notation = 'B'
  end
end

class Knight < Pieces
  def initialize(color, position)
    @role = 'knight'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265E" : "\u2658")
    @notation = 'N'
  end
end

class Rook < Pieces
  def initialize(color, position)
    @role = 'rook'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265C" : "\u2656")
    @notation = 'R'
  end
end

class Pawn < Pieces
  def initialize(color, position)
    @role = 'pawn'
    @color = color
    @position = position
    @symbol = (color == 'white' ? "\u265F" : "\u2659")
    @notation = ''
  end
end
