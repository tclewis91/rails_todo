class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def new
    render json: Todo.new
  end

  def create
  todo = Todo.create(task: params.fetch(:task), completed: params.fetch(:completed),
   incomplete: params.fetch(:incomplete))
    render json: todo
  end

  def view
   render json: Todo.find(params[:tasks])
  end

  def updated_rescue #destroy with if else
    if Todo.exists?(params[:tasks])
      Todo.destroy(params[:tasks])
      render json: { message: 'destroyed'}, status: 200 #tells folks shit was destroyed
    else
      render json: { error: 'Task not found' }, status: 404 #tells folks shit ain't found
    end
  end
end


