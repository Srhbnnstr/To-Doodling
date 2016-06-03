class DoodlesController < ApplicationController
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
        respond_to do |format|
          format.html {
            flash[:notice] ="Nice Doodle!"
            render :text => "<html><body><script type='text/javascript' charset='utf-8'>window.parent.document.location.href = '#viewer" +
                          doodle_path(@doodle) + "';</script></body></html>"
        }
      end
      else
      flash[:error]="We're sorry, something went wrong. Please try again."
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
end
