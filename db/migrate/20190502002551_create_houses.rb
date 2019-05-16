class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.string :landlord
      t.integer :rent
      t.integer :beds
      t.string :contact
      t.string :bathrooms
      t.string :further_details

      t.timestamps null: false
    end
  end
end
