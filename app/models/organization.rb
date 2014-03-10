class Organization < ActiveRecord::Base
  belongs_to :vehicle
  attr_accessible :contacts, :contactsphone, :lat, :legalperson, :lon, :name, :phone, :vehicle_id, :weight
  validates :name, :uniqueness => true
end
