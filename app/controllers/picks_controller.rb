class PicksController < ApplicationController

  def home
    @pick = Pick.current
    @end_of_draft = @pick.nil?
    @previous_picks = Pick.previous_picks
  end

  def index
    @picks = Pick.all
  end

  def show
    @pick = Pick.find(params[:id])
    @players = Player.undrafted
  end

  def draft_player

    player = Player.find(params[:id])

    unless player.drafted
      draft_over = Pick.current.team.draft(player)

      respond_to do |format|
        if (!draft_over && player.save)
          flash[:notice] = 'Player was successfully drafted.'
          format.html { redirect_to(pick_path(Pick.current)) }
        else
          flash[:notice] = 'The Draft is over, cannot pick more players,
          or there was an error drafting the player you selected'
          format.html { redirect_to(root_path) }
        end
      end

    else
      flash[:notice] = 'That player has already been drafted'
      redirect_to(pick_path(Pick.current))
    end
  end

  def results
    @draft_results = Pick.results
  end

end
