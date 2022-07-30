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

    def self.initial_state
        Model::State.new(
            snake: Model::Snake.new([
                Model::Coord.new(1,1)
                Model::Coord.new(0,1)
            ]),
            grid: Model::Grid.new(8,12),
            food: Model::Food.new(4,4)
        )
    end

end