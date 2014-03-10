class Vehicletype < ActiveRecord::Base
  has_many :vehicles
  attr_accessible :capacity, :fuel, :maintcycle, :name
  validates :name, :uniqueness => true
end
