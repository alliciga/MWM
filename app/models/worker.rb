class Worker < ActiveRecord::Base
  has_one :vehicle
  attr_accessible :certid, :lastcheckdate, :name, :phone, :type
  validates :name, :uniqueness => true
end
