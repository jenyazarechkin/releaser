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

ActiveRecord::Schema.define(version: 20151208201501) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "countries", ["deleted_at"], name: "index_countries_on_deleted_at", using: :btree

  create_table "countries_releases", force: :cascade do |t|
    t.integer "country_id", limit: 4
    t.integer "release_id", limit: 4
    t.string  "version",    limit: 255
    t.boolean "is_enabled"
  end

  add_index "countries_releases", ["country_id"], name: "index_countries_releases_on_country_id", using: :btree
  add_index "countries_releases", ["release_id"], name: "index_countries_releases_on_release_id", using: :btree

  create_table "releases", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "released_at"
    t.datetime "deleted_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "team_id",     limit: 4
  end

  add_index "releases", ["deleted_at"], name: "index_releases_on_deleted_at", using: :btree
  add_index "releases", ["team_id"], name: "index_releases_on_team_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "steps", ["deleted_at"], name: "index_steps_on_deleted_at", using: :btree

  create_table "steps_releases", force: :cascade do |t|
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "step_id",    limit: 4
    t.integer  "release_id", limit: 4
    t.boolean  "is_enabled"
  end

  add_index "steps_releases", ["release_id"], name: "index_steps_releases_on_release_id", using: :btree
  add_index "steps_releases", ["step_id"], name: "index_steps_releases_on_step_id", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "team_id",    limit: 4
  end

  add_index "team_members", ["team_id"], name: "index_team_members_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teams", ["deleted_at"], name: "index_teams_on_deleted_at", using: :btree

end
