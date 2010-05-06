class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :pick
  
  
  def self.kipers_best_available
    Player.first(:conditions => {:drafted => false})
  end
  
  def self.undrafted
    Player.find(:all, :conditions => {:drafted => false})
  end
end
