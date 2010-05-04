class PlayersController < ApplicationController
  def index
    @players = Players.all
  end
  
  def show
    @players = Players.find(params[:id])
  end
  
  def new
    @players = Players.new
  end
  
  def create
    @players = Players.new(params[:players])
    if @players.save
      flash[:notice] = "Successfully created players."
      redirect_to @players
    else
      render :action => 'new'
    end
  end
  
  def edit
    @players = Players.find(params[:id])
  end
  
  def update
    @players = Players.find(params[:id])
    if @players.update_attributes(params[:players])
      flash[:notice] = "Successfully updated players."
      redirect_to @players
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @players = Players.find(params[:id])
    @players.destroy
    flash[:notice] = "Successfully destroyed players."
    redirect_to players_url
  end
end
