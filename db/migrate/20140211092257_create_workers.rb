class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.date :lastcheckdate
      t.string :phone
      t.string :type
      t.string :certid
      t.string :name

      t.timestamps
    end
  end
end
