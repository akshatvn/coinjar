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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_16_131909) do

  create_table "currencies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "code", limit: 6, null: false
    t.float "last_last"
    t.float "last_ask"
    t.float "last_bid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "currency_snapshots", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.float "volume_24h", null: false
    t.float "volume", null: false
    t.datetime "transition_time", null: false
    t.string "status", limit: 40, null: false
    t.integer "session", null: false
    t.float "prev_close", null: false
    t.float "last", null: false
    t.datetime "current_time", null: false
    t.float "bid", null: false
    t.float "ask", null: false
    t.string "currency_code", limit: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_code", "created_at"], name: "idx_snapshot_cur_created"
  end

end
