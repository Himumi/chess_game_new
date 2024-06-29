require './lib/modules/converter.rb'
class Chess
  attr_accessor :board, :players

  include Converter

  def initialize(board, players)
    @board = board
    @players = players
  end

  def new_piece(role, color, position)
    piece = {
      'king' => King.new(color, position),
      'queen' => Queen.new(color, position),
      'bishop' => Bishop.new(color, position),
      'knight' => Knight.new(color, position),
      'rook' => Rook.new(color, position),
      'pawn' => Pawn.new(color, position)
    }

    piece[role]
  end

  def add_to_board
    @players.each do |player|
      player.pieces.each do |role, keys|
        keys.each do |key|
          @board.add(new_piece(role, player.color, key), convert_to_indexes(key))
        end
      end
    end
  end
end
