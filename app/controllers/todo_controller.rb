class TodoController < ApplicationController
  def index
    render json: Todo.all
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


