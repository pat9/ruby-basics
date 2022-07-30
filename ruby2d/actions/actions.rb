module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position()
        if next_position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            gameover(state)
        end
    end

    private
    def calc_next_position(state)
        current_position = state.snake.positions.first
        case state.next_direction
        when UP
            #less to row
           return Model::Coord.new(current_position.row - 1, current_position.col)
           
        when RIGHT
            #plus to col
           return Model::Coord.new(current_position.row, current_position.col + 1)

        when DOWN
            #plus to row
           return Model::Coord.new(current_position.row + 1, current_position.col)

        when LEFT
            #less to col   
           return Model::Coord.new(current_position.row, current_position.col - 1)
    end

    def next_position_is_valid?(state, position)
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) 
            || (position.col >= state.grid.cols || position.col < 0 ))

        return false if is_invalid
        return !(position.snake.positions.include? position) 
    end


    def move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def gameover(state)
        state.gameover = true
        state
    end
end