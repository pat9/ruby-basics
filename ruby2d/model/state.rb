module Model
    module Direction
        UP = :up,
        RIGHT = :right
        DOWN = :down
        LEFT = :left
    end
    class Coord
        attr_accessor :row, :col
        def initialize(row, col)
            @row = row
            @col = col
        end
    end

    class Food < Coord
        def initialize(row, col)
            super
        end
    end

    class Snake
        attr_accessor :positions
        def initialize(positions)
            @positions = positions
        end
    end

    class Grid
        attr_accessor :rows, :cols
        def initialize(rows, cols)
            @rows = rows
            @cols = cols
        end
    end

    class State
        attr_accessor :snake, :grid, :food, :current_direction, :gameover
        def initialize(snake, grid, food, current_direction, gameover)
            @snake = snake
            @grid = grid
            @food = food
            @current_direction = current_direction
            @gameover = gameover
        end
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),
                Model::Coord.new(0,1)
            ]),
            Model::Grid.new(8,12),
            Model::Food.new(4,4),
            Model::Direction::DOWN,
            false
        )
    end

end