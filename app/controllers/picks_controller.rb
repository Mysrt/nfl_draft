class PicksController < ApplicationController
  def index
    @picks = Picks.all
  end
  
  def show
    @picks = Picks.find(params[:id])
  end
  
  def new
    @picks = Picks.new
  end
  
  def create
    @picks = Picks.new(params[:picks])
    if @picks.save
      flash[:notice] = "Successfully created picks."
      redirect_to @picks
    else
      render :action => 'new'
    end
  end
  
  def edit
    @picks = Picks.find(params[:id])
  end
  
  def update
    @picks = Picks.find(params[:id])
    if @picks.update_attributes(params[:picks])
      flash[:notice] = "Successfully updated picks."
      redirect_to @picks
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @picks = Picks.find(params[:id])
    @picks.destroy
    flash[:notice] = "Successfully destroyed picks."
    redirect_to picks_url
  end
end
