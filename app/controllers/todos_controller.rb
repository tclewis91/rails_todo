class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def new
    render json: Todo.new
  end

  # def create
  # todo = Todo.create(task: params.fetch(:task), completed: params.fetch(:completed),
  #  incomplete: params.fetch(:incomplete))
  #   render json: todo
  # end



    def view
    begin
      render json: Todo.find(params[:id ])
    rescue ActiveRecord::RecordNotFound => error
      render json:{ error: error.message }, status: 404
    end
  end

   # def update
   #    if Todo.exists?(params[:id])
   #      todo = Todo.find(params[:id])
   #      render json: "#{todo.task}, #{todo.completed}, #{todo.incomplete}"
   #    else
   #      render json: 'Error: 404 User Not Found', status:404
   #    end
   #  end

  # def  #destroy with if else
  #   if Todo.exists?(params[:id])
  #     Todo.destroy(params[:id])
  #     render json: { message: 'destroyed'}, status: 200 #tells folks shit was destroyed
  #   else
  #     render json: { error: 'Task not found' }, status: 404 #tells folks shit ain't found
  #   end
  # end
end


