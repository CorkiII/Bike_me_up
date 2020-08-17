class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :bike, null: false, foreign_key: true
      t.date :start_date
      t.references :user, null: false, foreign_key: true
      t.date :end_date
      t.string :review
      t.integer :total_price

      t.timestamps
    end
  end
end
