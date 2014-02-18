class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.date :nextcheckdate
      t.date :lastmaintdate
      t.string :videophone
      t.string :gpsphone
      t.string :vehiclenum
      t.integer :vehicletype_id
      t.integer :driver_id
      t.integer :worker_id

      t.timestamps
    end
  end
end
