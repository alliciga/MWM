class Vehicle < ActiveRecord::Base
  belongs_to :vehicletype
  belongs_to :worker
  belongs_to :driver
  has_many   :organization
  attr_accessible :driver_id, :gpsphone, :lastmaintdate, :nextcheckdate, :name, :vehicletype_id, :videophone, :worker_id
  validates :name, :uniqueness => true
end
