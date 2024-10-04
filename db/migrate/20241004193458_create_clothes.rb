class CreateClothes < ActiveRecord::Migration[7.1]
  def change
    create_table :clothes do |t|
      t.string :size
      t.integer :price
      t.string :name
      t.string :brand
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
