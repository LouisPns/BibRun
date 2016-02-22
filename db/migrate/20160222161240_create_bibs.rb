class CreateBibs < ActiveRecord::Migration
  def change
    create_table :bibs do |t|
      t.integer :price
      t.integer :quantity
      t.string :sale_reason
      t.references :race, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
