class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name
      t.string :review
      t.string :address
      t.string :website

      t.timestamps null: false
    end
  end
end
