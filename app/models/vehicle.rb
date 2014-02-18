class Vehicle < ActiveRecord::Base
  belongs_to :vehicletype
  belongs_to :worker
  belongs_to :driver
  attr_accessible :driver_id, :gpsphone, :lastmaintdate, :nextcheckdate, :vehiclenum, :vehicletype_id, :videophone, :worker_id
end
