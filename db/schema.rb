# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150210154628) do

  create_table "adverts", :force => true do |t|
    t.text     "content"
    t.decimal  "rent"
    t.integer  "user_id"
    t.date     "expiration_date"
    t.integer  "property_id"
    t.integer  "nb_of_free_beds"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.integer  "advert_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "properties", :force => true do |t|
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "kind"
    t.boolean  "furnished"
    t.boolean  "parking"
    t.boolean  "internet"
    t.boolean  "tv"
    t.boolean  "washing_machine"
    t.boolean  "dryer"
    t.boolean  "dishwasher"
    t.integer  "nb_of_rooms"
    t.integer  "nb_of_bathrooms"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "phone"
    t.text     "biography"
    t.date     "dob"
    t.string   "gender"
    t.string   "nationality"
    t.integer  "property_id"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "last_name"
    t.boolean  "admin"
  end

end
