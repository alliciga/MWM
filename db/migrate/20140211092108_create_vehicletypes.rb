class CreateVehicletypes < ActiveRecord::Migration
  def change
    create_table :vehicletypes do |t|
      t.integer :maintcycle
      t.float :fuel
      t.float :capacity
      t.string :name

      t.timestamps
    end
  end
end
