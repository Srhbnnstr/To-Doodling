class ListsController < ApplicationController
  def index
    @list = List.all.order(created_at: :desc)
    @user = User.find_by_id(params[:id])
  end

  def show
    @list = List.find_by_id(params[:id])
    @todos = @list.todos.sort_by(&:due_date)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(post_params)
    @list.user_id = @current_user.id

    if @list.save
      redirect_to @list
    else
      render new_list_path
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      redirect_to edit_list_path(@list)
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private

  def list_params
    params.require(:list).permit(:list_title, :time_frame)
  end

end
