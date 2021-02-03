class Bomb
    def initialize(pos)
        @pos = pos
        @value = "_"
        @revealed = false
        @flagged = false
    end

    def reveal
        return "Flagged tiles cannot be revealed. Unflag first" if @flagged == true
        @revealed = true
        @value = 8
    end

    def exploded?
        @revealed
    end


    def flag
        @flagged = true
        @value = "F"
    end


    def remove_flag
        @flagged = false
    end


    def to_s
        @value.to_s
    end

    def inspect
        {"value" => @value, "pos"=>@pos, "exploded?"=>@revealed, "flagged"=> @flagged}
    end
    def neighbors
    end
    def neighbor_bomb_count
    end
end
