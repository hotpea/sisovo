class Egg < ActiveRecord::Base
  attr_accessible :chicken_id
  belongs_to :chicken
end
