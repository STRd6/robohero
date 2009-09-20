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

ActiveRecord::Schema.define(:version => 20090906224246) do

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

  create_table "deck_list_versions", :force => true do |t|
    t.integer  "deck_list_id"
    t.integer  "version"
    t.integer  "account_id"
    t.string   "name"
    t.text     "card_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deck_list_versions", ["deck_list_id"], :name => "index_deck_list_versions_on_deck_list_id"

  create_table "deck_lists", :force => true do |t|
    t.integer  "account_id", :null => false
    t.string   "name",       :null => false
    t.text     "card_data",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "version"
  end

  create_table "facebook_logins", :force => true do |t|
    t.integer  "account_id"
    t.integer  "fb_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_cards", :force => true do |t|
    t.integer  "location_id",                      :null => false
    t.string   "location_type",                    :null => false
    t.integer  "position",          :default => 0, :null => false
    t.integer  "card_id",                          :null => false
    t.integer  "cooldown_counters", :default => 0, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "game_cards", ["location_id", "location_type"], :name => "index_game_cards_on_location_id_and_location_type"

  create_table "game_events", :force => true do |t|
    t.integer  "game_id",     :null => false
    t.integer  "stack_depth", :null => false
    t.integer  "player",      :null => false
    t.integer  "datum_id",    :null => false
    t.string   "datum_type",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "game_events", ["game_id"], :name => "index_game_events_on_game_id"

  create_table "games", :force => true do |t|
    t.string   "name",                         :null => false
    t.boolean  "open",       :default => true, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "games", ["open"], :name => "index_games_on_open"

  create_table "link_events", :force => true do |t|
    t.integer  "link_id",                  :null => false
    t.string   "session_id", :limit => 32, :null => false
    t.string   "action",     :limit => 16, :null => false
    t.datetime "created_at",               :null => false
  end

  create_table "links", :force => true do |t|
    t.integer  "account_id",                :null => false
    t.integer  "target_id"
    t.string   "target_type"
    t.string   "token",       :limit => 32, :null => false
    t.string   "channel",     :limit => 16, :null => false
    t.datetime "created_at",                :null => false
  end

  add_index "links", ["token"], :name => "index_links_on_token", :unique => true

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "open_id_logins", :force => true do |t|
    t.integer  "account_id",   :null => false
    t.string   "identity_url", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "open_id_logins", ["identity_url"], :name => "index_open_id_logins_on_identity_url", :unique => true

  create_table "players", :force => true do |t|
    t.integer  "game_id",    :null => false
    t.integer  "account_id", :null => false
    t.integer  "robot_id",   :null => false
    t.string   "name",       :null => false
    t.integer  "health",     :null => false
    t.integer  "armor",      :null => false
    t.integer  "energy",     :null => false
    t.integer  "money",      :null => false
    t.integer  "egen",       :null => false
    t.integer  "body_slots", :null => false
    t.integer  "arm_slots",  :null => false
    t.integer  "misc_slots", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["game_id"], :name => "index_players_on_game_id"

  create_table "robots", :force => true do |t|
    t.string   "name",                       :null => false
    t.integer  "egen",       :default => 2,  :null => false
    t.integer  "energy_max", :default => 6,  :null => false
    t.integer  "health_max", :default => 30, :null => false
    t.integer  "armor",      :default => 0,  :null => false
    t.integer  "arm_slots",  :default => 0,  :null => false
    t.integer  "body_slots", :default => 0,  :null => false
    t.integer  "misc_slots", :default => 0,  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
