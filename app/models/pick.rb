class Pick < ActiveRecord::Base
  has_one :player
  has_one :team
  
  def team
    Team.find(self.team_id)
  end
  
end
