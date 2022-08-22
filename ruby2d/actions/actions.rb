module Actions
    def self.move_snake(state)
        current_direction = state.current_direction
        next_position = calc_next_position(state)
        if next_position_is_food?(state, next_position)
            state = grow_snake_to(state, next_position)
            generate_food(state)
        elsif next_position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            gameover(state)
        end
    end

    def self.change_direction(state, direction)
        if next_direction_is_valid?(state, direction)
            state.current_direction = direction
        else
            puts "Invalid direction"
        end
        state
    end

    private
    def self.generate_food(state)
        new_food = Model::Food.new(rand(state.grid.rows), rand(state.grid.cols))
        state.food = new_food
        state
    end
    def self.grow_snake_to(state, next_position)
        new_snake_positions = [next_position] + state.snake.positions
        state.snake.positions = new_snake_positions
        state
    end

    def self.calc_next_position(state)
        current_position = state.snake.positions.first
        case state.current_direction
        when Model::Direction::UP
            #less to row
           return Model::Coord.new(current_position.row - 1, current_position.col)
           
        when Model::Direction::RIGHT
            #plus to col
           return Model::Coord.new(current_position.row, current_position.col + 1)

        when Model::Direction::DOWN
            #plus to row
           return Model::Coord.new(current_position.row + 1, current_position.col)

        when Model::Direction::LEFT
            #less to col   
           return Model::Coord.new(current_position.row, current_position.col - 1)
        end
    end

    def self.next_position_is_valid?(state, position)
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) || (position.col >= state.grid.cols || position.col < 0 ))

        return false if is_invalid
        return !(state.snake.positions.include? position) 
    end

    def self.next_position_is_food?(state, next_position)
        state.food.col == next_position.col &&  state.food.row == next_position.row
    end

    def self.move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def self.gameover(state)
        state.gameover = true
        state
    end

    def self.next_direction_is_valid?(state, direction)
        case state.current_direction
        when Model::Direction::UP
            return true if direction != Model::Direction::DOWN
        when Model::Direction::DOWN
            return true if direction != Model::Direction::UP
        when Model::Direction::LEFT
            return true if direction != Model::Direction::RIGHT
        when Model::Direction::RIGHT
            return true if direction != Model::Direction::LEFT
        end

        return false
    end
end