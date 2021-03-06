class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  Date.beginning_of_week = :sunday

  def index
    @users = User.all
    @todos = Todo.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.photo == ""
      @user.photo = "pencil-icon"
    end
    if @user.save
    flash[:notice] = "Thanks for creating an account with To-Doodle, " + @user.first_name + "!"
    login(@user)
    redirect_to @user
    else
      flash[:error] = "Please fill in all required fields (marked with *)"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @todos = Todo.all
  end

  def edit
    user_id = params[:id]
    @user = User.find_by(id: user_id)
  end

  def update
    user_id = params[:id]
    user = User.find_by(id: user_id)
    if user.update(user_params)
      flash[:notice] = "Your profile has been successfully updated!"
      redirect_to user_path(user)
    else
      flash[:error] = "Please fill in all required fields (marked with *)"
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password, :photo)
  end
end
