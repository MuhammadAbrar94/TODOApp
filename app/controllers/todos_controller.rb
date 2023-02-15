class TodosController < ApplicationController
  before_action :set_todo, only: [:edit,:update,:show]
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
    end

    def edit
    end
    def update
      if @todo.update(todo_params)
        flash[:notice] = "Todo was succesfull updated"
        redirect_to todo_path(@todo)
      else 
        render 'edit'
      end
    end

    def index
      @todo = Todo.all
    end

    private
        def set_todo
          @todo = Todo.find(params[:id])
        end
        def todo_params
            params.require(:todo).permit(:name, :description)
        end
end
