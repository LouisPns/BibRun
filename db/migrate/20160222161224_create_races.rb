class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :address
      t.date :date
      t.integer :distance
      t.string :type
      t.string :name
      t.string :label
      t.string :picture

      t.timestamps null: false
    end
  end
end
