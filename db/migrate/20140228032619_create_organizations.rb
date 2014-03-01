class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.float :lon
      t.float :lat
      t.string :legalperson
      t.string :phone
      t.string :contacts
      t.string :contactsphone
      t.float :weight
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
