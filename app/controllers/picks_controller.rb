class PicksController < ApplicationController
  
  def home
    @previous_picks = []
    @pick = Pick.current
    @previous_picks = Pick.previous_picks
  end
  
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
    @pick = Pick.find(params[:id])
    
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
  
  def draft_player
    player = Player.find(params[:id])
    draft_over = Pick.current.team.draft(player)
    
    respond_to do |format|
      unless draft_over && !player.save
        flash[:notice] = 'Player was successfully drafted.'
        format.html { redirect_to(pick_path(Pick.current)) }
      else
        flash[:notice] = 'The Draft is over, cannot pick more players, 
        or there was an error drafting the player you selected'
        format.html { redirect_to(root_path) }
      end
    end
  end
  
  def results
    @draft_results = Pick.results
  end
  
  protected
  
  def get_pick
    @pick = Pick.find(params[:id])
  end
end
