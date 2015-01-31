class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.text :content
      t.decimal :rent
      t.integer :user_id
      t.date :expiration_date
      t.integer :property_id
      t.integer :nb_of_free_beds

      t.timestamps
    end
  end
end
