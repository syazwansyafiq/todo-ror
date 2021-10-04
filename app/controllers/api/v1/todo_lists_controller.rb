class Api::V1::TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[ show ]

  def index
    @todo_lists = TodoList.all
    render json: @todo_lists, status: 200
  end

  def show
    @todo_list = TodoList.find_by(id: params[:id])
    if @todo_list
      render json: @todo_list, status: 200
    else 
      render json: {status: "error", code: 3000, message: "Can't find the to do list"}
    end
  end

  def todo_items
    @todo_list = TodoList.find_by(id: params[:id])
    if @todo_list
      @items = @todo_list.todo_items; 
      render json: @items, status: 200
    else 
      render json: {status: "error", code: 3000, message: "Can't find the to do list"}
    end
  end

  private
  
  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end
end
