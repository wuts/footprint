# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 5) do

  create_table "footprints", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity",    :limit => 10, :precision => 10, :scale => 0
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "myfootprints", :force => true do |t|
    t.integer  "user_id"
    t.integer  "footprint_id"
    t.integer  "porgress_id"
    t.datetime "occur_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "myprogresses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "progress_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "progresses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.string   "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
