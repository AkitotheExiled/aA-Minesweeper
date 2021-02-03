require_relative "./bomb.rb"
require "byebug"

class Tile
    attr_accessor :nearby_bombs, :value
    def initialize(pos, board)
        @board = board
        @pos = pos
        @default_value = nil
        @value = "_"
        @revealed = false
        @flagged = false


    end


    def flag
        if @flagged
            remove_flag
        else
            @flagged = true
            @default_value = @value
            @value = "F"
        end
    end


    def remove_flag
        @flagged = false
        @value = @default_value

    end

    def reveal
        return "Flagged tiles cannot be revealed. Unflag first" if @flagged == true
        return "Already revealed" if @revealed == true
        @revealed = true
        @value = neighbor_bomb_count
        return value.to_s

    end

    def neighbors

        immediate_neighbors = []

        [-1,0,1].each do |i|

            left = [@pos[0]-1,@pos[1]+i]
            mid = [@pos[0], @pos[1]+i]
            right = [@pos[0]+1,@pos[1]+i]

            [left,mid,right].each_with_index do |pos,idx|
                if pos.any? {|val| val < 0 || val > 8}
                    pos[0] = @pos[0]
                    pos[1] = @pos[1]
                end
            end


            immediate_neighbors.push(@board[left], @board[mid], @board[right])

        end

        immediate_neighbors.uniq
    end


    def neighbor_bomb_count
        neigh_arr = neighbors
        bomb_count = neigh_arr.count {|arr| arr.is_a?(Bomb)}
        bomb_count
    end

    def to_s
        @value.to_s
    end

    def inspect
        {'value'=> @value, 'pos'=> @pos, 'revealed'=> @revealed, 'flagged'=> @flagged}
    end

    def exploded?
    end
end
