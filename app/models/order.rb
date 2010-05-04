class Order < ActiveRecord::Base
  has_one :player
end
