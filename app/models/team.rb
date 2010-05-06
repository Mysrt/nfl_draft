class Team < ActiveRecord::Base
  belongs_to :pick
  has_many :players
  
  def kiper_draft
    player = Player.kipers_best_available    
    do_drafting(player,self) 
  end
  
  def draft(player)
    unless Pick.current.pick_number == 255
      do_drafting(player,self)
      draft_over = false
    else
      draft_over = true
    end
  end
  
  
  
  
  protected
  
  def do_drafting(player, team)
      player.drafted          = true
      player.save
      
      current_pick            = Pick.current
      current_pick.player     = player
      current_pick.player_id  = player.id
      current_pick.used       = true
      current_pick.save
      team.players.push(player)

  end
  
end
