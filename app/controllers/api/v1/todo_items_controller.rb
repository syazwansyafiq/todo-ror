class Api::V1::TodoItemsController < ApplicationController
  before_action :set_todo_list

  def index
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_items = @todo_list.todo_items
    if @todo_items
      render json: @todo_items, status: 200
    else 
      render json: {status: "error", code: 3000, message: "Can't find the to do list"}
    end
  end

  def show
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item 
      render json: @todo_item, status: 200
    else 
      render json: {status: "error", code: 3000, message: "Can't find the to do list"}
    end
  end

  private

  def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_items_params
      params[:todo_item].permit(:content)
  end
end
