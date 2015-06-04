class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def new
    render json: Todo.new
  end

  def create
  begin
    todoapp = Todo.create(tasks: params[:tasks])
    render json: todoapp, status: 200
  rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end
end

  def view
  begin
    render json: Todo.find(params[:id ])
  rescue ActiveRecord::RecordNotFound => error
    render json: { error: error.message }, status: 404
    end
  end

  def destroy
    if Todo.exists?(params[:id])
      Todo.destroy(params[:id])
      render json: { message: 'destroyed'}, status: 202
    else
      render json: { error: 'Task not found' }, status: 404
    end
end
end


