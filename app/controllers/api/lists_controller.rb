module Api
  class ListsController < ApplicationController
    protect_from_forgery with: :null_session

    # GET /api/lists.json
    def index
      lists = List.all
      render json: lists
    end

    # GET /api/lists/{slug}.json
    def show
      list_with_todos = List.find_by(slug: params[:slug]).as_json(include: :todos)
      render json: list_with_todos
    end

    # POST /api/lists.json
    def create
      list = List.new
      if list.save
        render json: list
      else
        render json: { message: list.errors.messages }, status: 422
      end
    end

    # PUT /api/lists/{id}.json
    def update
      list = List.find_by(params[:id])
      if list.update(list_params)
        render json: list
      else
        render json: { message: list.errors.messages }, status: 422
      end
    end

    # DELETE /api/lists/{id}.json
    def destroy
      list = List.find(params[:id])
      if list.destroy
        head :no_content
      else
        render json: { message: list.errors.messages }, status: 422
      end
    end

    private 

    def list_params
      params.require(:list).permit(:title)
    end
  end
end