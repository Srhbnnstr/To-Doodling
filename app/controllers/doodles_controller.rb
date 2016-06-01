class DoodlesController < ApplicationController
  require 'json'


  def index
    @doodles = Doodle.all
  end

  def show
    @doodle = Doodle.find(params[:id])
  end

  def new
    @doodle = Doodle.new
  end

  def create
    @doodle = Doodle.new(params[:doodle])

      if @doodle.save

      else
      render :action => 'new'
      end
  end

  def edit
    @doodle = Doodle.find(params[:id])
  end

  def update
    @doodle = Doodle.find(params[:id])
    if @doodle.update_attributes(params[:doodle])
      flash[:notice] = "successfully updated doodle"
      redirect_to @doodle
    else
      render :action => "edit"
    end
  end

  def destroy
    @doodle = Doodle.find(params[:id])
    @doodle.destroy
    flash[:notice] = "sucessfully destroyed doodle"
    redirect_to doodles_path
  end


private
  def doodle_params
    params.require(:doodle).permit(:image, :note, :user_id, :list_)
  end

end
