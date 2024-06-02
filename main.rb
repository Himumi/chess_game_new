require './lib/chess/chess.rb'
require './lib/board/board.rb'
require './lib/pieces/pieces.rb'
require './lib/players/players.rb'

first_player = WhitePlayer.new('himumi')
second_player = BlackPlayer.new('himumi')
board = Board.new
game = Chess.new(board, [first_player, second_player])


game.add_to_board
game.board.print_board
