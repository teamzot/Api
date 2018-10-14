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

ActiveRecord::Schema.define(version: 2018_10_14_201513) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "post_title"
    t.string "post_user"
    t.boolean "satisfaction"
    t.integer "annual_refresh"
    t.integer "area"
    t.integer "degree"
    t.string "equity_schedule"
    t.integer "experience"
    t.integer "experience_level"
    t.boolean "greencard"
    t.integer "job_function"
    t.integer "job_type"
    t.integer "level"
    t.string "other_offer"
    t.integer "position_type"
    t.datetime "post_time"
    t.string "promotion_package"
    t.integer "relocation_fee"
    t.integer "season"
    t.integer "source"
    t.datetime "spider_time"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
  end

end
