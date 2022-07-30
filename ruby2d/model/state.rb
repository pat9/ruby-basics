module Model
    class Coord
        attr_accessor :row, :col
    end

    class Food < Coord
    end

    class Snake
        attr_accessor :positions
    end

    class Grid
        attr_accessor :rows, :cols
    end

    class State
        attr_accessor :snake, :grid, :food
    end
end