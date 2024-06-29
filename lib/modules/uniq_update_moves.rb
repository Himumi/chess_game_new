module UniqUpdateMoves
  def update_moves(board)
    result = []
    base = convert_to_indexes(position)

    @paths.times do |path|
      key = direction(base, path)

      next if key.nil? || (!board.on(key).nil? && board.on(key).ally?(@color))

      result << convert_to_key(key)
    end
    
    @valid_moves = result
  end
end
