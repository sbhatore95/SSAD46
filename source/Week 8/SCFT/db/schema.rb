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

ActiveRecord::Schema.define(version: 20141115234746) do

  create_table "cities", force: true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "source"
    t.integer  "wmonum"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "timezone"
    t.float    "elevation"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "City"
    t.string   "State"
    t.string   "Country"
    t.string   "Data_Source"
    t.integer  "WMO_Number"
    t.float    "Latitude"
    t.float    "Longitude"
    t.float    "Time_Zone"
    t.float    "Elevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "weatherdata", force: true do |t|
    t.string   "city"
    t.string   "qualfile"
    t.float    "mjan"
    t.float    "mfeb"
    t.float    "mmar"
    t.float    "mapr"
    t.float    "mmay"
    t.float    "mjun"
    t.float    "mjul"
    t.float    "maug"
    t.float    "msep"
    t.float    "moct"
    t.float    "mnov"
    t.float    "mdec"
    t.float    "njan"
    t.float    "nfeb"
    t.float    "nmar"
    t.float    "napr"
    t.float    "nmay"
    t.float    "njun"
    t.float    "njul"
    t.float    "naug"
    t.float    "nsep"
    t.float    "noct"
    t.float    "nnov"
    t.float    "ndec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
