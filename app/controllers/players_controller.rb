class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
  end
  
  def undrafted
    unless params[:position.nil?]
      @players = Player.filter_position(params[:position])
    else
      @players = Player.undrafted
    end
  end
end
