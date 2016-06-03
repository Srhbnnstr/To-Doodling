class ListsController < ApplicationController
  def index
    @user = current_user
    @lists = @user.lists.order(created_at: :desc)

    render :index
  end

  def show
    @list = List.find_by_id(params[:id])
    @user = current_user
    @todos = @list.todos
    render :show
  end

  def new
    @list = List.new
    @user = current_user
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      flash[:notice] = "Your list was created!"
      redirect_to @list
    else
      flash[:error] = "Please fill in all required fields (marked with *)"
      render new_list_path
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
    @user = current_user
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
