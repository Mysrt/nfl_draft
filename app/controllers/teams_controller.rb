class TeamsController < ApplicationController
  def index
    @teams = Teams.all
  end
  
  def show
    @teams = Teams.find(params[:id])
  end
  
  def new
    @teams = Teams.new
  end
  
  def create
    @teams = Teams.new(params[:teams])
    if @teams.save
      flash[:notice] = "Successfully created teams."
      redirect_to @teams
    else
      render :action => 'new'
    end
  end
  
  def edit
    @teams = Teams.find(params[:id])
  end
  
  def update
    @teams = Teams.find(params[:id])
    if @teams.update_attributes(params[:teams])
      flash[:notice] = "Successfully updated teams."
      redirect_to @teams
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @teams = Teams.find(params[:id])
    @teams.destroy
    flash[:notice] = "Successfully destroyed teams."
    redirect_to teams_url
  end
end
