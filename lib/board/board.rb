class Board
  attr_reader :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def print_board
    letters = "       A   B   C   D   E   F   G   H  "
    dashed = "     ---------------------------------"

    puts letters, dashed

    board.each_with_index do |items, row|
      line = "  #{8 - row}  |" # Add letter for each row
      items.each_with_index do |item, column|
        item.nil? ? line += '   |' : line += " #{item} |"

        line += "  #{8 - row}" if column.equal?(items.length - 1) # Add letter after last column
      end
      puts line, dashed
    end
    puts letters
  end

  def add(input, source)
    row, column = source[0], source[1]
    @board[row][column] = input
  end

  def remove(row, column)
    @board[row][column] = nil
  end

  def move(source, goal)
    @board[goal[0]][goal[1]] = @board[source[0]][source[1]]
    @board[source[0]][source[1]] = nil
  end
end
