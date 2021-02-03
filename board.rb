require_relative "./tile.rb"
require_relative "./bomb.rb"


class Board
    attr_accessor :tiles
    def self.randomly_fill_grid(board = nil)
        grid = Array.new(9) { Array.new(9) }
        bomb_count = 0
        bomb_max = 9
        grid.each_with_index do |arr,idx|
            arr.each_with_index do |ele,idx2|
                random_value = rand(8)
                if random_value == 1 && bomb_count < bomb_max
                    bomb_count +=1
                    grid[idx][idx2] = Bomb.new([idx,idx2])
                else
                    grid[idx][idx2] = Tile.new([idx,idx2], board)
                end
            end
        end
        grid

    end
    def initialize(tiles)
        @tiles = tiles
    end

    def [](pos)
        col, row = pos[0], pos[1]
        @tiles[col][row]
    end

    def []=(pos,val)
        col, row = pos[0], pos[1]
        @tiles[col][row] = val
    end
end
