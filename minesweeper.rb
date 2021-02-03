
require_relative "./board.rb"
require "pp"
class MineSweeper
    def self.randomly_fill_grid
        the_board = Board.new(nil)
        grid = Board.randomly_fill_grid(the_board)
        the_board.grid = grid
        the_board
    end

    def initialize(board)
        @board = board

    end

    def get_pos
        pos = nil
        until pos && valid_pos?(pos)
            puts "Please enter a position on the board (e.g., '3,4')"
            pos = parse_pos(gets.chomp)
        end
        pos
    end

    def get_val
        val = nil
        until val && valid_val?(val)
            puts "Type r to reveal the space or f to flag it"
            val = parse_val(gets.chomp)
        end
        val
    end

    def valid_pos?(pos)
        return false if pos.any? {|indice| indice.is_a?(String)} || pos.length < 2 || pos.length > 2
        return true
    end

    def valid_val?(val)
        return false if val.length > 1 || "abcdeghijklmnopqstuvwxyz".include?(val) || !val.is_a?(String)
        return true
    end

    def parse_pos(pos)
        pos.split(",").map(&:to_i)
    end

    def parse_val(val)
        val
    end

    def prompt
        pos = get_pos
        val = get_val
        if val == "r"
            tile_value = @board[pos].reveal
            if tile_value == "0"
                @board.reveal_tiles(@board[pos].neighbors)
            end
        else
            @board[pos].flag
        end
    end


    def play
        until solved?
            @board.render
            prompt
        end
        @board.render_after_winorloss
    end


    def solved?
        @board.solved?
    end
end

board = MineSweeper.randomly_fill_grid
the_game = MineSweeper.new(board)
the_game.play


