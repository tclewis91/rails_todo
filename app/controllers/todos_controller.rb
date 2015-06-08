class TodosController < ApplicationController
  def index
    all_todos = Todo.all
    respond_to do |format|
      format.html do
        render 'index.html.erb', locals: { todos_index: all_todos }
      end
      format.json do
        render json: all_todos
      end
    end
  end

  def new
    new_todos = Todo.new
    respond_to do |format|
      format.html do
        render 'new.html.erb', locals: { todos_new: new_todos }
      end
      format.json
        render json: new_todos
      end
    end
  end

  def create
    todoapp = Todo.create(tasks: params[:tasks])
    respond_to do |format|
      format.html do
        render 'create.html.erb', locals: { todos_create: todoapp }
      end
      format.json
        render json: todoapp
      end
    end


  def show
    search_todos = Todo.find(params[:id ])
    respond_to do |format|
      format.html do
        render 'show.html.erb', locals: { todos_show: search_todos }
      end
      format.json do
        render json: found_student
      end
    end
  end


  # def destroy
  #   if Todo.exists?(params[:id])
  #     Todo.destroy(params[:id])
  #     render json: { message: 'destroyed' }, status: 202
  #   else
  #     render json: { error: 'Task not found' }, status: 404
  #   end
  # end


