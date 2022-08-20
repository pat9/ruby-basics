require 'ruby2d'
require_relative '../model/state'

module View
    class Ruby2dView
        def initialize(app)
            @pixe_size = 50
            @app = app
        end

        def start(state)
            extend Ruby2D::DSL
            set(
                title: "Snake",
                width: @pixe_size * state.grid.cols,
                height: @pixe_size * state.grid.rows
            )
            on :key_down do |event|
                # A key was pressed
                handle_key_event event
            end
            show
        end

        def render_game(state)
            extend Ruby2D::DSL
            close if state.gameover
            render_snake(state)
            render_food(state)
        end
        
        private
        def render_food(state)
            @food.remove if @food
            Ruby2D::DSL
            food = state.food
            @food = Square.new(
                x: food.col * @pixe_size, y: food.row * @pixe_size,
                size: @pixe_size,
                color: 'yellow',
            )
            
        end
        def render_snake(state)
            @snake_positions.each(&:remove) if @snake_positions
            extend Ruby2D::DSL
            snake = state.snake
            @snake_positions=snake.positions.map do |position| 
                Square.new(
                    x: position.col * @pixe_size, y: position.row * @pixe_size,
                    size: @pixe_size,
                    color: 'green',
                )
            end
            
        end
        def handle_key_event(event)
            case event.key
            when "up"
                @app.send_action(:change_direction, Model::Direction::UP)
            when "down"
                @app.send_action(:change_direction, Model::Direction::DOWN)
            when "left"
                @app.send_action(:change_direction, Model::Direction::LEFT)
            when "right"
                @app.send_action(:change_direction, Model::Direction::RIGHT)
                
            end
        end
    end
end