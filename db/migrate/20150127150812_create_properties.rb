class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.string :type
      t.boolean :furnished
      t.boolean :parking
      t.boolean :internet
      t.boolean :tv
      t.boolean :washing_machine
      t.boolean :dryer
      t.boolean :dishwasher
      t.integer :nb_of_rooms
      t.integer :nb_of_bathrooms

      t.timestamps
    end
  end
end
