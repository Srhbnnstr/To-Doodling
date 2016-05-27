class TodosController < ApplicationController
  def show
    @todo = Todo.find_by(params[:id])
  end

  def new
    @list = List.find_by_id(params[:list_id])
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @list = List.find(params[:list_id])
    @todo.save
    if @list.todos.push(@todo)
      current_user.list.todo.push(@todo)
      redirect_to list_path(@list)
    else
      @todo.destroy
        flash[:error] = "Something went wrong, please try again"
        redirect_to new_todo_path(@todo)
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
