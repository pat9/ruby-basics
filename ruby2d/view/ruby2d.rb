require 'ruby2d'
module View
    class Ruby2dView
        def initialize
            @pixe_size = 50
        end
        def render(state)
            extend Ruby2D::DSL
            set(
                title: "Snake",
                width: @pixe_size * state.grid.cols,
                height: @pixe_size * state.grid.rows
            )
            render_snake(state)
            render_food(state)
            show
        end
        
        private
        def render_food(state)
            extend Ruby2D::DSL
            food = state.food
            Square.new(
                x: food.col * @pixe_size, y: food.row * @pixe_size,
                size: @pixe_size,
                color: 'yellow',
            )
            
        end
        def render_snake(state)
            extend Ruby2D::DSL
            snake = state.snake
            snake.positions.each do |position| 
                Square.new(
                    x: position.col * @pixe_size, y: position.row * @pixe_size,
                    size: @pixe_size,
                    color: 'green',
                )
            end
            
        end
    end
end