module Api
  class TodosController < ApplicationController
    protect_from_forgery with: :null_session

    # def index
    #   todo = Todo.all
    #   render json: todo
    # end
    
    # POST /api/todos.json
    def create
      todo = Todo.new(todo_params)
      if todo.save
        render json: todo
      else
        render json: { message: todo.errors.messages }, status: 422
      end
    end

    # PUT /api/todos/{id}.json
    def update
      todo = Todo.find(params[:id])
      if todo.update(todo_params)
        render json: todo
      else
        render json: { message: todo.errors.messages }, status: 422
      end
    end

    # def destroy
    #   todo = Todo.find(params[:id])
    #   if todo.destroy
    #     head :no_content
    #   else
    #     render json: { errors: todo.errors.messages }, status: 422
    #   end
    # end

    private 

    def todo_params
      params.require(:todo).permit(:value, :done, :list_id)
    end
  end
end