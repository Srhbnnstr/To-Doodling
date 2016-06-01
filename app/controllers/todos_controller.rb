class TodosController < ApplicationController
  before_action :get_id, only: [:update, :destroy]
  before_action :todo_params, only: [:update, :create]

  def index
    @todos = current_user.todos.all
    @lists  = current_user.lists
  end

  def done
  @todo = todo.find(params[:id])
  p "inside complete"
  p "complete = #{params[:done]}"
  @todo.done =

    if @todo.update_attributes(params[:todo])
      p "inside update"
      render :text => "success"
    else
      p "inside error"
    end

end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
    @list = List.find_by_id(params[:id])
    render :new
  end

  def create
    @list = List.find_by_id(params[:list_id])
    p"***************"
    p @list
    @todo = current_user.todos.new(todo_params)
    @list.todos << @todo
    @list.save
    @todo.save
      if @todo.save
      flash[:notice] = "Your task was created."
      redirect_to list_path(@list)
      else
      @todo.destroy
      flash[:error] = "There was an error creating your task."
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
    @list = List.find_by_id(params[:id])
    @todo = Todo.find_by_id(params[:id])
      @todo.destroy
      flash[:succes] = "Todo destroyed."
      redirect_to list_path(@list)
  end

    private

  def get_id
    todo_id = params[:id]
    Todo.find_by_id(todo_id)
    list_id = params[:id]
    List.find_by_id(list_id)
  end

  def todo_params
    params.require(:todo).permit(:title, :start_time, :end_time, :done)
  end
end
