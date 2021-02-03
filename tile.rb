require_relative "./bomb.rb"

class Tile
    attr_accessor :nearby_bombs, :value
    def initialize(pos, board)
        @pos = pos
        @value = 0
        @revealed = false
        @bombed = false
        @flagged = false
        @board = board
    end


    def flag
        @flagged = true
    end


    def remove_flag
        @flagged = false
    end

    def reveal
        raise "Flagged tiles cannot be revealed. Unflag first" if @flagged == true
        @revealed = true
    end

    def neighbors
        immediate_neighbors = []

        left = [@pos[0]-1,@pos[1]]
        right = [@pos[0]+1,@pos[1]]
        i = 0
        while i < 3
            left = [@pos[0]-1,@pos[1]+i]
            mid = [@pos[0], @pos[1]+i]
            right = [@pos[0]+1,@pos[1]+i]
            immediate_neighbors.push(@board[left], @board[mid], @board[right])
            i+=1
        end
        p immediate_neighbors
        immediate_neighbors
    end

    def neighbor_bomb_count
        neigh_arr = neighbors
        neigh_arr.count {|arr| arr.is_a?(Bomb)}
    end

    def to_s
        @value.to_s
    end

    def inspect
        {'value'=> @value, 'pos'=> @pos, 'revealed'=> @revealed, 'flagged'=> @flagged}
    end
end
