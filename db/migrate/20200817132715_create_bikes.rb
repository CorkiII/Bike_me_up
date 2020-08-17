class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :model
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :gender
      t.string :color
      t.integer :gear
      t.text :description
      t.integer :price
      t.string :style

      t.timestamps
    end
  end
end
