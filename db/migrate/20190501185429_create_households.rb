class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :name
      t.string :review
      t.string :address
      t.string :website

      t.timestamps null: false
    end
  end
end
