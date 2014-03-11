class Chicken < ActiveRecord::Base
  has_many :eggs, :dependent => :delete_all
  validates :name, :presence => true, :length => { :minimum => 3 }
  validates :color, :presence => true, :length => { :minimum => 3 }
  attr_accessible :id, :name, :color

  def countEggs
    count = Egg.find_all_by_chicken_id(self.id).length
  end
end
