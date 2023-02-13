class TodosController < ApplicationController
    def new
        @todo = Todo.new
    end

    def create
      @todo = Todo.create(todo_params)
      if @todo.save 
        flash[:notice] = "Todo was created successfully"
        redirect_to todo_path(@todo)
      else
        render 'new', status: 300
      end    
    end

    def show
      @todo = Todo.find(params[:id])
    end

    private
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end
