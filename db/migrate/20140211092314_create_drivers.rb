class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.date :lastcheckdate
      t.string :phone
      t.string :type
      t.string :certid
      t.string :name

      t.timestamps
    end
  end
end
