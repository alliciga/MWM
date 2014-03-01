class ChangeColumnnameToVehicles < ActiveRecord::Migration
  def up
    rename_column(:vehicles,"vehiclenum","name")
  end

  def down
  end
end
