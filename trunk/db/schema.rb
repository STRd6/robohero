# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090805003529) do

  create_table "accounts", :force => true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.datetime "last_login",                                             :null => false
    t.integer  "total_logins",                            :default => 0, :null => false
    t.string   "referral_code"
    t.integer  "referrer_id"
  end

  create_table "card_instances", :force => true do |t|
    t.integer  "account_id", :null => false
    t.integer  "card_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cards", :force => true do |t|
    t.string   "name",                        :null => false
    t.integer  "dollar_cost", :default => 0,  :null => false
    t.integer  "energy_cost", :default => 0,  :null => false
    t.integer  "ready_time",  :default => 0,  :null => false
    t.string   "rules_text",  :default => "", :null => false
    t.string   "flavor_text", :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "deck_instances", :force => true do |t|
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", :force => true do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logins", :force => true do |t|
    t.integer  "account_id",   :null => false
    t.string   "identity_url", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "logins", ["identity_url"], :name => "index_logins_on_identity_url", :unique => true

  create_table "robot_instances", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "robots", :force => true do |t|
    t.string   "name"
    t.integer  "egen"
    t.integer  "emax"
    t.integer  "armor"
    t.integer  "arm_slots"
    t.integer  "bod_slots"
    t.integer  "misc_slots"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "health"
  end

end
