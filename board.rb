require_relative "./tile.rb"
require_relative "./bomb.rb"
require "byebug"

class Board
    attr_accessor :grid
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
    def initialize(grid)
        @grid = grid
    end

    def render
        puts "  #{(0..8).to_a.join(' ')}"
        @grid.each_with_index do |row, i|
            puts "#{i} #{row.join(' ')}"
        end
    end

    def render_after_winorloss
        grid = @grid.each do |arr|
            arr.map!(&:reveal)
        end
        puts "  #{(0..8).to_a.join(' ')}"
        grid.each_with_index do |row, i|
            puts "#{i} #{row.join(' ')}"
        end
    end

    def [](pos)

        col, row = pos[0], pos[1]
        @grid[col][row]
    end

    def []=(pos,val)
        col, row = pos[0], pos[1]
        @grid[col][row] = val
    end

    def solved?
        @grid.any? {|row| row.any? {|tile| tile.exploded?}}
    end

    def pos_exist?(pos)
        @grid.any? {|row| row.any? {|tile| tile.pos==pos}}
    end
    def reveal_tiles(tiles)
        
        tiles.each do |tile|
            if tile.neighbor_bomb_count <= 0
                tile.reveal
            end
        end
    end


end
