class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :image
      t.date :checkin_date
      t.date :checkout_date
      t.string :name_of_hotel
      t.integer :number_of_people
      t.integer :length_of_stay
      t.integer :amount_of_money

      t.timestamps
    end
  end
end
