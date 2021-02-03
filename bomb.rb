class Bomb
    def initialize(pos)
        @pos = pos
        @value = 7
        @revealed = false
        @flagged = false
    end

    def reveal
        raise "Flagged tiles cannot be revealed. Unflag first" if @flagged == true
        @revealed = true
    end

    def exploded?
        @revealed
    end


    def flag
        @flagged = true
    end


    def remove_flag
        @flagged = false
    end


    def to_s
        @value.to_s
    end

    def inspect
        {"value" => @value, "exploded?"=>@revealed, "flagged"=> @flagged}
    end
    def neighbors
    end
end
