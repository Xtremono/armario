class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clothe, null: false, foreign_key: true
      t.integer :price
      t.datetime :order_date

      t.timestamps
    end
  end
end
