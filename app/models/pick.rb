class Pick < ActiveRecord::Base
  has_one :player
  has_one :team

  validates_presence_of  :team_id

  def team
    Team.find(self.team_id)
  end

  def self.results
    Pick.find(:all, :conditions => {:used => true})
  end

  def self.current
    Pick.first(:conditions => {:used => false})
  end

  def self.previous
    pick = Pick.current
    unless(pick.pick_number == 1)
      Pick.find_by_pick_number(pick.pick_number-1)
    else
      pick
    end

  end

  def self.next
    Pick.find_by_pick_number(Pick.current.pick_number+1)
  end

  def self.previous_picks
    picks = Pick.find(:all, :conditions => {:used => true})
    #technically they should already be sorted, but to be robust
    picks.sort_by {|pick| pick['pick_number']}
    picks.reverse!
    picks = picks[0...3]
  end


end
