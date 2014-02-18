class Driver < ActiveRecord::Base
  has_one :vehicle
  attr_accessible :certid, :lastcheckdate, :name, :phone, :type
end
