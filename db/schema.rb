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

ActiveRecord::Schema.define(:version => 20130716011422) do

  create_table "deployments", :force => true do |t|
    t.integer  "ship_id",     :null => false
    t.integer  "game_id",     :null => false
    t.integer  "lives",       :null => false
    t.string   "orientation", :null => false
    t.integer  "positions",                   :array => true
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "platform_id",                    :null => false
    t.string   "full_name",                      :null => false
    t.string   "email",                          :null => false
    t.boolean  "over",        :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "won",         :default => false, :null => false
    t.integer  "lives",       :default => 0,     :null => false
  end

  add_index "games", ["platform_id"], :name => "index_games_on_platform_id", :unique => true

  create_table "ships", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "length",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "turns", :force => true do |t|
    t.integer  "game_id",                        :null => false
    t.integer  "position",                       :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "attacked",   :default => false,  :null => false
    t.string   "status",     :default => "miss", :null => false
  end

end
