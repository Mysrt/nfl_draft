class Team < ActiveRecord::Base
  belongs_to :pick
  has_many :players
  
  def kiper_draft
    player = Player.kipers_best_available
    do_drafting(player)
    
    self.players.push(player)
  end
  
  def draft(player)
    if player.nil?
      player = Player.kipers_best_available
    end
    do_drafting(player)
    
    self.players.push(player)
  end
  
  protected
  
  def do_drafting(player)
    player.drafted = true
    player.save
    
    current_pick = Pick.current
    current_pick.player = player
    current_pick.used = true
    current_pick.save
  end
end
