class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :date
      t.references :user, index: true, foreign_key: true
      t.references :bib, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
