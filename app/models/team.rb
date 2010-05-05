class Team < ActiveRecord::Base
  belongs_to :pick
  has_many :players
end
