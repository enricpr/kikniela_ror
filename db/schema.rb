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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140722170433) do

  create_table "assignments", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["game_id"], name: "index_assignments_on_game_id"
  add_index "assignments", ["team_id"], name: "index_assignments_on_team_id"

  create_table "bets", force: true do |t|
    t.integer  "user_id"
    t.integer  "week"
    t.integer  "hits"
    t.integer  "tip1"
    t.integer  "tip2"
    t.integer  "tip3"
    t.integer  "tip4"
    t.integer  "tip5"
    t.integer  "tip6"
    t.integer  "tip7"
    t.integer  "tip8"
    t.integer  "tip9"
    t.integer  "tip10"
    t.integer  "tip11"
    t.integer  "tip12"
    t.integer  "tip13"
    t.integer  "tip14"
    t.integer  "tip15"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bets", ["user_id"], name: "index_bets_on_user_id"

  create_table "games", force: true do |t|
    t.string   "team1"
    t.string   "team2"
    t.integer  "result"
    t.integer  "week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "color1"
    t.string   "color2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.integer  "points"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
