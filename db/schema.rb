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

ActiveRecord::Schema.define(:version => 20130318194402) do

  create_table "bulbs", :force => true do |t|
    t.string   "lookup_code"
    t.string   "bulb_type"
    t.float    "wattage"
    t.string   "manufacturer"
    t.boolean  "energy_star"
    t.float    "cost"
    t.float    "lumens"
    t.float    "temperature"
    t.string   "model_number"
    t.string   "link"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "estimates", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "replacement_bulbs", :force => true do |t|
    t.integer  "bulb_id"
    t.integer  "replacement_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "replacements", :force => true do |t|
    t.integer  "quantity"
    t.string   "current_bulb_name"
    t.float    "current_bulb_wattage"
    t.integer  "replacement_bulb_id"
    t.float    "percent_reduction"
    t.integer  "estimate_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
