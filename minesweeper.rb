
require_relative "./board.rb"
require "pp"
class MineSweeper
    def self.randomly_fill_grid
        the_board = Board.new(nil)
        grid = Board.randomly_fill_grid(the_board)
        the_board.tiles = grid
        the_board
    end

    def initialize(board)
        @board = board
        PP.pp(board.tiles[0][0].neighbor_bomb_count)
    end
end

board = MineSweeper.randomly_fill_grid
the_game = MineSweeper.new(board)


