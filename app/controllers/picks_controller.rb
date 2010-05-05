class PicksController < ApplicationController
  def index
    @picks = Pick.all
  end
  
  def show
    @pick = Pick.find(params[:id])
  end
  
  def new
    @pick = Pick.new
  end
  
  def create
    @pick = Pick.new(params[:pick])
    if @pick.save
      flash[:notice] = "Successfully created pick."
      redirect_to @pick
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pick = Pick.find(params[:id])
  end
  
  def update
    @pick = Pick.find(params[:id])
    if @pick.update_attributes(params[:pick])
      flash[:notice] = "Successfully updated pick."
      redirect_to @pick
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy
    flash[:notice] = "Successfully destroyed pick."
    redirect_to picks_url
  end
end
