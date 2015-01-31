class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :phone
      t.text :biography
      t.date :dob
      t.string :gender
      t.string :nationality
      t.integer :property_id
      t.string :password_digest

      t.timestamps
    end
  end
end
