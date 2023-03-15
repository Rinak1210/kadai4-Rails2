class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :name_of_hotel
      t.text :introduction
      t.integer :price
      t.text :address
      t.date :checkin_date
      t.date :checkout_date
      t.integer :number_of_people

      t.timestamps
    end
  end
end
