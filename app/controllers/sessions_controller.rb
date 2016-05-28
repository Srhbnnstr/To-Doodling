class SessionsController < ApplicationController
  require 'bcrypt'

  def new

  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Welcome!"
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end
end
