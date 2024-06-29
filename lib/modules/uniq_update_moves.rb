module UniqUpdateMoves
  def update_moves(board)
    result = []
    converted = convert_to_indexes(position)

    @paths.times do |path|
      stop = false
      base = converted

      @each_path.times do
        curr = direction(base, path)

        if stop or curr.nil? or (
            !board.is_empty(curr) and board.on(curr).ally?(@color)
          )
          stop = true
          next
        end

        if !board.is_empty(curr) and board.on(curr).ally?(@color)
          stop = true
        end

        result << convert_to_key(curr)
        base = curr
      end
    end
    @valid_moves = result
  end
end
