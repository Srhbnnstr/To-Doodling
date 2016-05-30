class TodosController < ApplicationController
  before_action :todo_params, only: [:update, :create]
  def index
    @list = List.find_by_id(params[:list_id])
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
    @list = List.find_by_id(params[:list_id])
    render :new
  end

  def create
    @todo = Todo.new(todo_params)
    @list = List.find_by(params[:list_id])
    @todo.save
      if @list.todos.push(@todo)
      redirect_to list_path(@list)
      else
      @todo.destroy
      flash[:error] = "please try again"
      redirect_to new_todo_path(@list)
      end
  end

  def edit
    @todo = Todo.find(params[:todo_id])
  end

  def update
    @todo = Todo.find(params[:todo_id])
    if @user.list.todo == current_user
      @list = List.find(params[:list_id])
      if @todo.update(todo_params)
        flash[:success] = "Success!"
        redirect_to list_path(@list)
      else
        flash[:error] = "Error!"
        redirect_to edit_todo_path(@list)
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
      @list = List.find(params[:list_id])
      @todo.destroy
      flash[:succes] = "Todo destroyed."
      redirect_to list_path(@list)
  end

    private

  def todo_params
    params.require(:todo).permit(:title, :date_due, :time_due)
  end
end
